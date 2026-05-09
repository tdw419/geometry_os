; DESCRIPTION: Renders a orange line between points (183, 145) and (179, 36).
; PLAN: r0=183(x1), r1=145(y1), r2=179(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 145
LDI r2, 179
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
