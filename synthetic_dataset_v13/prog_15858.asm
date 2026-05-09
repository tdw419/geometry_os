; DESCRIPTION: Draws a magenta line from (139, 34) to (348, 61).
; PLAN: r0=139(x1), r1=34(y1), r2=348(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 34
LDI r2, 348
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
