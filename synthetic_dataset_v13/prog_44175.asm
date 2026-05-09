; DESCRIPTION: Places a black line segment connecting (96, 210) to (348, 112).
; PLAN: r0=96(x1), r1=210(y1), r2=348(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 210
LDI r2, 348
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
