; DESCRIPTION: Composite: Renders a orange disk with center (259, 136) and radius 51 then Places a blue line segment connecting (232, 112) to (331, 244).
; PLAN: r0=259(x), r1=136(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=232(x1), r6=112(y1), r7=331(x2), r8=244(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 136
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 232
LDI r6, 112
LDI r7, 331
LDI r8, 244
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
