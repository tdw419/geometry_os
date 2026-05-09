; DESCRIPTION: Renders a purple line between points (18, 169) and (485, 10).
; PLAN: r0=18(x1), r1=169(y1), r2=485(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 169
LDI r2, 485
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
