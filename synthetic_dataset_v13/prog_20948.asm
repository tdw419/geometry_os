; DESCRIPTION: Renders a yellow line between points (4, 185) and (348, 32).
; PLAN: r0=4(x1), r1=185(y1), r2=348(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 185
LDI r2, 348
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
