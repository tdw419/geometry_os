; DESCRIPTION: Places a red line segment connecting (376, 113) to (36, 251).
; PLAN: r0=376(x1), r1=113(y1), r2=36(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 113
LDI r2, 36
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
