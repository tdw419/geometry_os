; DESCRIPTION: Places a yellow line segment connecting (139, 57) to (360, 31).
; PLAN: r0=139(x1), r1=57(y1), r2=360(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 57
LDI r2, 360
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
