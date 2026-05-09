; DESCRIPTION: Renders a black line between points (426, 73) and (348, 5).
; PLAN: r0=426(x1), r1=73(y1), r2=348(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 73
LDI r2, 348
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
