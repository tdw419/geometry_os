; DESCRIPTION: Places a red line segment connecting (137, 254) to (20, 1).
; PLAN: r0=137(x1), r1=254(y1), r2=20(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 254
LDI r2, 20
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
