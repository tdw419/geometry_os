; DESCRIPTION: Places a black line segment connecting (199, 182) to (388, 112).
; PLAN: r0=199(x1), r1=182(y1), r2=388(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 182
LDI r2, 388
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
