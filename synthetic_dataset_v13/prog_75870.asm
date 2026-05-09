; DESCRIPTION: Places a yellow line segment connecting (225, 137) to (495, 168).
; PLAN: r0=225(x1), r1=137(y1), r2=495(x2), r3=168(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 137
LDI r2, 495
LDI r3, 168
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
