; DESCRIPTION: Renders a yellow line between points (348, 80) and (333, 183).
; PLAN: r0=348(x1), r1=80(y1), r2=333(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 80
LDI r2, 333
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
