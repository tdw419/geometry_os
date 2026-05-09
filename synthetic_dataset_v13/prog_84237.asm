; DESCRIPTION: Places a red line segment connecting (305, 66) to (201, 26).
; PLAN: r0=305(x1), r1=66(y1), r2=201(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 66
LDI r2, 201
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
