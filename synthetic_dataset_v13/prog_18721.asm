; DESCRIPTION: Places a black line segment connecting (341, 113) to (348, 178).
; PLAN: r0=341(x1), r1=113(y1), r2=348(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 113
LDI r2, 348
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
