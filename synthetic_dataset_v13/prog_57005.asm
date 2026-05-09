; DESCRIPTION: Composite: Renders a cyan box of size 100x69 starting at (21, 109) then Sets a single orange pixel at (413, 175) then Renders a red disk with center (413, 91) and radius 37.
; PLAN: r0=21(x), r1=109(y), r2=100(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x), r6=175(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=413(x), r11=91(y), r12=37(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 21
LDI r1, 109
LDI r2, 100
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 175
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 413
LDI r11, 91
LDI r12, 37
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
