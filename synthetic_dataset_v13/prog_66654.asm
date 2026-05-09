; DESCRIPTION: Places a red line segment connecting (305, 139) to (459, 89).
; PLAN: r0=305(x1), r1=139(y1), r2=459(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 139
LDI r2, 459
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
