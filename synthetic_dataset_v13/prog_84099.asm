; DESCRIPTION: Draws a blue line from (312, 218) to (399, 237).
; PLAN: r0=312(x1), r1=218(y1), r2=399(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 218
LDI r2, 399
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
