; DESCRIPTION: Draws a magenta line from (348, 202) to (282, 100).
; PLAN: r0=348(x1), r1=202(y1), r2=282(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 202
LDI r2, 282
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
