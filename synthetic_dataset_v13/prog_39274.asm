; DESCRIPTION: Draws a orange line from (237, 36) to (419, 216).
; PLAN: r0=237(x1), r1=36(y1), r2=419(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 36
LDI r2, 419
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
