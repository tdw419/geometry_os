; DESCRIPTION: Draws a orange line from (449, 221) to (377, 99).
; PLAN: r0=449(x1), r1=221(y1), r2=377(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 221
LDI r2, 377
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
