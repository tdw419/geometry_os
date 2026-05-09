; DESCRIPTION: Composite: Renders a yellow disk with center (183, 95) and radius 10 then Draws a purple rectangle at (115, 26) with width 91 and height 91 then Places a blue dot at position (160, 201).
; PLAN: r0=183(x), r1=95(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x), r6=26(y), r7=91(width), r8=91(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=160(x), r11=201(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 183
LDI r1, 95
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 26
LDI r7, 91
LDI r8, 91
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 160
LDI r11, 201
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
