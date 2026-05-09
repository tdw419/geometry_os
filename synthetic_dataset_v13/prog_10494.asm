; DESCRIPTION: Places a purple line segment connecting (454, 107) to (485, 254).
; PLAN: r0=454(x1), r1=107(y1), r2=485(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 107
LDI r2, 485
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
