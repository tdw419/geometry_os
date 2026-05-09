; DESCRIPTION: Places a red line segment connecting (325, 247) to (500, 10).
; PLAN: r0=325(x1), r1=247(y1), r2=500(x2), r3=10(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 247
LDI r2, 500
LDI r3, 10
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
