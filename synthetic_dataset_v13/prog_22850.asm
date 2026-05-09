; DESCRIPTION: Places a black line segment connecting (73, 14) to (505, 139).
; PLAN: r0=73(x1), r1=14(y1), r2=505(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 14
LDI r2, 505
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
