; DESCRIPTION: Draws a orange line from (82, 30) to (5, 139).
; PLAN: r0=82(x1), r1=30(y1), r2=5(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 30
LDI r2, 5
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
