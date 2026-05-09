; DESCRIPTION: Places a white line segment connecting (2, 110) to (338, 64).
; PLAN: r0=2(x1), r1=110(y1), r2=338(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 110
LDI r2, 338
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
