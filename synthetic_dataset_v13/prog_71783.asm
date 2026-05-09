; DESCRIPTION: Places a yellow line segment connecting (233, 54) to (200, 82).
; PLAN: r0=233(x1), r1=54(y1), r2=200(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 54
LDI r2, 200
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
