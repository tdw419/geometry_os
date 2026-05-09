; DESCRIPTION: Places a red line segment connecting (247, 211) to (199, 112).
; PLAN: r0=247(x1), r1=211(y1), r2=199(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 211
LDI r2, 199
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
