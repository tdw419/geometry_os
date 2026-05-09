; DESCRIPTION: Renders a purple line between points (485, 201) and (85, 83).
; PLAN: r0=485(x1), r1=201(y1), r2=85(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 201
LDI r2, 85
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
