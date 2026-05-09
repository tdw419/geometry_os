; DESCRIPTION: Places a yellow line segment connecting (30, 74) to (461, 104).
; PLAN: r0=30(x1), r1=74(y1), r2=461(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 74
LDI r2, 461
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
