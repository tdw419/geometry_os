; DESCRIPTION: Renders a blue line between points (491, 218) and (470, 115).
; PLAN: r0=491(x1), r1=218(y1), r2=470(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 218
LDI r2, 470
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
