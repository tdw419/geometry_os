; DESCRIPTION: Composite: Renders a blue line between points (270, 204) and (306, 101) then Sets a single blue pixel at (105, 102) then Places a orange circle of radius 68 at center (281, 180).
; PLAN: r0=270(x1), r1=204(y1), r2=306(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=102(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=281(x), r11=180(y), r12=68(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 270
LDI r1, 204
LDI r2, 306
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 102
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 281
LDI r11, 180
LDI r12, 68
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
