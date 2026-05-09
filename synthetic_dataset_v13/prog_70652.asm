; DESCRIPTION: Places a yellow line segment connecting (477, 49) to (150, 233).
; PLAN: r0=477(x1), r1=49(y1), r2=150(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 49
LDI r2, 150
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
