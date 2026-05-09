; DESCRIPTION: Renders a purple line between points (485, 13) and (337, 122).
; PLAN: r0=485(x1), r1=13(y1), r2=337(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 13
LDI r2, 337
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
