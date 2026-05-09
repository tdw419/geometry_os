; DESCRIPTION: Places a red line segment connecting (490, 255) to (30, 109).
; PLAN: r0=490(x1), r1=255(y1), r2=30(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 255
LDI r2, 30
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
