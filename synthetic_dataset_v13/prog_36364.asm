; DESCRIPTION: Draws a orange line from (120, 158) to (247, 93).
; PLAN: r0=120(x1), r1=158(y1), r2=247(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 158
LDI r2, 247
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
