; DESCRIPTION: Draws a orange line from (467, 19) to (507, 52).
; PLAN: r0=467(x1), r1=19(y1), r2=507(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 19
LDI r2, 507
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
