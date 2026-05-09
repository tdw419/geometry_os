; DESCRIPTION: Places a white line segment connecting (458, 128) to (52, 77).
; PLAN: r0=458(x1), r1=128(y1), r2=52(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 128
LDI r2, 52
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
