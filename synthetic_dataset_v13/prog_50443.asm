; DESCRIPTION: Places a black line segment connecting (99, 68) to (495, 237).
; PLAN: r0=99(x1), r1=68(y1), r2=495(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 68
LDI r2, 495
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
