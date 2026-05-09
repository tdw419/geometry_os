; DESCRIPTION: Renders a blue line between points (439, 122) and (447, 155).
; PLAN: r0=439(x1), r1=122(y1), r2=447(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 122
LDI r2, 447
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
