; DESCRIPTION: Composite: Renders a blue line between points (161, 89) and (129, 222) then Places a blue dot at position (195, 199) then Renders a blue disk with center (43, 177) and radius 40.
; PLAN: r0=161(x1), r1=89(y1), r2=129(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=195(x), r6=199(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=43(x), r11=177(y), r12=40(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 161
LDI r1, 89
LDI r2, 129
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 199
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 43
LDI r11, 177
LDI r12, 40
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
