; DESCRIPTION: Places a red line segment connecting (477, 6) to (253, 100).
; PLAN: r0=477(x1), r1=6(y1), r2=253(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 6
LDI r2, 253
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
