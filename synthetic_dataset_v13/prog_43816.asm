; DESCRIPTION: Places a red line segment connecting (194, 116) to (20, 139).
; PLAN: r0=194(x1), r1=116(y1), r2=20(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 116
LDI r2, 20
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
