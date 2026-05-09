; DESCRIPTION: Places a black line segment connecting (348, 62) to (282, 250).
; PLAN: r0=348(x1), r1=62(y1), r2=282(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 62
LDI r2, 282
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
