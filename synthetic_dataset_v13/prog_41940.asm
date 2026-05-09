; DESCRIPTION: Places a white line segment connecting (348, 161) to (324, 24).
; PLAN: r0=348(x1), r1=161(y1), r2=324(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 161
LDI r2, 324
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
