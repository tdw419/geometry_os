; DESCRIPTION: Renders a blue line between points (312, 218) and (210, 35).
; PLAN: r0=312(x1), r1=218(y1), r2=210(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 218
LDI r2, 210
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
