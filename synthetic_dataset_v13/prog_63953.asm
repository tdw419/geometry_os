; DESCRIPTION: Renders a purple line between points (312, 132) and (328, 237).
; PLAN: r0=312(x1), r1=132(y1), r2=328(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 132
LDI r2, 328
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
