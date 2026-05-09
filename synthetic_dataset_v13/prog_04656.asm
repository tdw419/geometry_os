; DESCRIPTION: Places a black line segment connecting (314, 79) to (485, 50).
; PLAN: r0=314(x1), r1=79(y1), r2=485(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 79
LDI r2, 485
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
