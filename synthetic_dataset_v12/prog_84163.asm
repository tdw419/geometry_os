; DESCRIPTION: Places a black line segment connecting (140, 200) to (348, 239).
; PLAN: r0=140(x1), r1=200(y1), r2=348(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 200
LDI r2, 348
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
