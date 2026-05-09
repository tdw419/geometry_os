; DESCRIPTION: Renders a black line between points (348, 179) and (309, 58).
; PLAN: r0=348(x1), r1=179(y1), r2=309(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 179
LDI r2, 309
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
