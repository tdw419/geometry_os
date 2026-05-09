; DESCRIPTION: Places a yellow line segment connecting (495, 141) to (23, 196).
; PLAN: r0=495(x1), r1=141(y1), r2=23(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 141
LDI r2, 23
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
