; DESCRIPTION: Places a red line segment connecting (32, 212) to (20, 139).
; PLAN: r0=32(x1), r1=212(y1), r2=20(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 212
LDI r2, 20
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
