; DESCRIPTION: Renders a magenta line between points (321, 132) and (348, 132).
; PLAN: r0=321(x1), r1=132(y1), r2=348(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 132
LDI r2, 348
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
