; DESCRIPTION: Places a yellow line segment connecting (342, 23) to (360, 120).
; PLAN: r0=342(x1), r1=23(y1), r2=360(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 23
LDI r2, 360
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
