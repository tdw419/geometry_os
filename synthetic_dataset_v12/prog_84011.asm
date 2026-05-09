; DESCRIPTION: Places a white line segment connecting (72, 158) to (342, 137).
; PLAN: r0=72(x1), r1=158(y1), r2=342(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 158
LDI r2, 342
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
