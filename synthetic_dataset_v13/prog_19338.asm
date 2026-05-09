; DESCRIPTION: Places a red line segment connecting (472, 221) to (194, 67).
; PLAN: r0=472(x1), r1=221(y1), r2=194(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 221
LDI r2, 194
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
