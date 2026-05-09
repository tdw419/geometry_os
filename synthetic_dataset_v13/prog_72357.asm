; DESCRIPTION: Places a yellow line segment connecting (495, 39) to (26, 233).
; PLAN: r0=495(x1), r1=39(y1), r2=26(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 39
LDI r2, 26
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
