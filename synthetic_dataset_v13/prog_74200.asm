; DESCRIPTION: Places a red line segment connecting (72, 53) to (194, 227).
; PLAN: r0=72(x1), r1=53(y1), r2=194(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 53
LDI r2, 194
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
