; DESCRIPTION: Places a purple line segment connecting (483, 229) to (485, 57).
; PLAN: r0=483(x1), r1=229(y1), r2=485(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 229
LDI r2, 485
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
