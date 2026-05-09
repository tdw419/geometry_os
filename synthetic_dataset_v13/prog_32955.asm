; DESCRIPTION: Draws a magenta line from (348, 148) to (110, 2).
; PLAN: r0=348(x1), r1=148(y1), r2=110(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 148
LDI r2, 110
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
