; DESCRIPTION: Draws a orange line from (439, 139) to (85, 216).
; PLAN: r0=439(x1), r1=139(y1), r2=85(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 139
LDI r2, 85
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
