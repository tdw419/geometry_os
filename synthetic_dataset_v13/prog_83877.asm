; DESCRIPTION: Draws a orange line from (140, 179) to (274, 6).
; PLAN: r0=140(x1), r1=179(y1), r2=274(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 179
LDI r2, 274
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
