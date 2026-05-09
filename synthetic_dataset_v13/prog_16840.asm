; DESCRIPTION: Draws a red line from (451, 139) to (343, 87).
; PLAN: r0=451(x1), r1=139(y1), r2=343(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 139
LDI r2, 343
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
