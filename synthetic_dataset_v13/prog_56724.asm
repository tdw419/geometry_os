; DESCRIPTION: Places a purple line segment connecting (485, 208) to (27, 102).
; PLAN: r0=485(x1), r1=208(y1), r2=27(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 208
LDI r2, 27
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
