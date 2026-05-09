; DESCRIPTION: Places a black line segment connecting (14, 82) to (485, 147).
; PLAN: r0=14(x1), r1=82(y1), r2=485(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 82
LDI r2, 485
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
