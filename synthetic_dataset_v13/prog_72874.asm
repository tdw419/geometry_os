; DESCRIPTION: Draws a black line from (485, 109) to (347, 188).
; PLAN: r0=485(x1), r1=109(y1), r2=347(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 109
LDI r2, 347
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
