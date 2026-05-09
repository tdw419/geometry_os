; DESCRIPTION: Draws a orange line from (86, 214) to (336, 216).
; PLAN: r0=86(x1), r1=214(y1), r2=336(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 214
LDI r2, 336
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
