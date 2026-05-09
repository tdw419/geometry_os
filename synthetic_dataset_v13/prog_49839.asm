; DESCRIPTION: Draws a black line from (485, 37) to (314, 114).
; PLAN: r0=485(x1), r1=37(y1), r2=314(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 37
LDI r2, 314
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
