; DESCRIPTION: Renders a purple line between points (447, 62) and (169, 32).
; PLAN: r0=447(x1), r1=62(y1), r2=169(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 62
LDI r2, 169
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
