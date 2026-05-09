; DESCRIPTION: Places a yellow line segment connecting (304, 35) to (141, 3).
; PLAN: r0=304(x1), r1=35(y1), r2=141(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 35
LDI r2, 141
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
