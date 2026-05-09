; DESCRIPTION: Places a red line segment connecting (334, 112) to (2, 36).
; PLAN: r0=334(x1), r1=112(y1), r2=2(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 112
LDI r2, 2
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
