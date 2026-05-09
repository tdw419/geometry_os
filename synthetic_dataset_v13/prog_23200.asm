; DESCRIPTION: Places a purple line segment connecting (485, 8) to (392, 65).
; PLAN: r0=485(x1), r1=8(y1), r2=392(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 8
LDI r2, 392
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
