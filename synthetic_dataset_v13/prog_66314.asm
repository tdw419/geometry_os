; DESCRIPTION: Renders a purple line between points (20, 27) and (312, 237).
; PLAN: r0=20(x1), r1=27(y1), r2=312(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 27
LDI r2, 312
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
