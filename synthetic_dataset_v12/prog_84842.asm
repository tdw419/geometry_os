; DESCRIPTION: Renders a blue line between points (424, 244) and (185, 19).
; PLAN: r0=424(x1), r1=244(y1), r2=185(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 244
LDI r2, 185
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
