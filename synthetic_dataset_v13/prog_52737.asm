; DESCRIPTION: Places a red line segment connecting (500, 151) to (247, 137).
; PLAN: r0=500(x1), r1=151(y1), r2=247(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 151
LDI r2, 247
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
