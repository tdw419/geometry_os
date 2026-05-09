; DESCRIPTION: Composite: Renders a green box of size 37x107 starting at (66, 46) then Places a black dot at position (190, 68) then Renders a red disk with center (316, 120) and radius 68.
; PLAN: r0=66(x), r1=46(y), r2=37(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=68(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=316(x), r11=120(y), r12=68(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 66
LDI r1, 46
LDI r2, 37
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 68
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 316
LDI r11, 120
LDI r12, 68
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
