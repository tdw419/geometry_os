; DESCRIPTION: Composite: Renders a white box of size 11x54 starting at (484, 102) then Sets a single purple pixel at (177, 188) then Places a yellow circle of radius 15 at center (87, 211).
; PLAN: r0=484(x), r1=102(y), r2=11(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=177(x), r6=188(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=87(x), r11=211(y), r12=15(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 484
LDI r1, 102
LDI r2, 11
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 188
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 87
LDI r11, 211
LDI r12, 15
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
