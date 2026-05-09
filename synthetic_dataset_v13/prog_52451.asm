; DESCRIPTION: Composite: Renders a black box of size 99x65 starting at (248, 151) then Places a orange dot at position (473, 101) then Renders a orange disk with center (297, 169) and radius 66.
; PLAN: r0=248(x), r1=151(y), r2=99(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=473(x), r6=101(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=297(x), r11=169(y), r12=66(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 248
LDI r1, 151
LDI r2, 99
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 101
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 297
LDI r11, 169
LDI r12, 66
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
