; DESCRIPTION: Places a red line segment connecting (192, 131) to (55, 109).
; PLAN: r0=192(x1), r1=131(y1), r2=55(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 131
LDI r2, 55
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
