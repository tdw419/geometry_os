; DESCRIPTION: Draws a orange line from (477, 139) to (119, 249).
; PLAN: r0=477(x1), r1=139(y1), r2=119(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 139
LDI r2, 119
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
