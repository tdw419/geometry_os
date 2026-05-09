; DESCRIPTION: Places a blue line segment connecting (287, 182) to (505, 50).
; PLAN: r0=287(x1), r1=182(y1), r2=505(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 182
LDI r2, 505
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
