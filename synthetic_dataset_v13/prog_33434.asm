; DESCRIPTION: Renders a purple line between points (369, 214) and (219, 128).
; PLAN: r0=369(x1), r1=214(y1), r2=219(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 214
LDI r2, 219
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
