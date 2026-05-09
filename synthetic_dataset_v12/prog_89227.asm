; DESCRIPTION: Renders a blue line between points (185, 17) and (253, 254).
; PLAN: r0=185(x1), r1=17(y1), r2=253(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 17
LDI r2, 253
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
