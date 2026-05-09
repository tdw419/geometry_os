; DESCRIPTION: Places a red line segment connecting (199, 110) to (24, 52).
; PLAN: r0=199(x1), r1=110(y1), r2=24(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 110
LDI r2, 24
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
