; DESCRIPTION: Draws a blue line from (370, 126) to (485, 45).
; PLAN: r0=370(x1), r1=126(y1), r2=485(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 126
LDI r2, 485
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
