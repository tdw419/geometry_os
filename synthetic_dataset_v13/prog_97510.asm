; DESCRIPTION: Draws a black line from (433, 158) to (485, 163).
; PLAN: r0=433(x1), r1=158(y1), r2=485(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 158
LDI r2, 485
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
