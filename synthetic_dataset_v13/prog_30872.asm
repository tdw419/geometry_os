; DESCRIPTION: Places a white line segment connecting (111, 191) to (100, 77).
; PLAN: r0=111(x1), r1=191(y1), r2=100(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 191
LDI r2, 100
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
