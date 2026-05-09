; DESCRIPTION: Draws a black line from (133, 4) to (485, 14).
; PLAN: r0=133(x1), r1=4(y1), r2=485(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 4
LDI r2, 485
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
