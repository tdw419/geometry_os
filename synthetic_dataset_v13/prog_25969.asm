; DESCRIPTION: Draws a orange line from (449, 6) to (507, 153).
; PLAN: r0=449(x1), r1=6(y1), r2=507(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 6
LDI r2, 507
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
