; DESCRIPTION: Places a blue line segment connecting (297, 233) to (15, 139).
; PLAN: r0=297(x1), r1=233(y1), r2=15(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 233
LDI r2, 15
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
