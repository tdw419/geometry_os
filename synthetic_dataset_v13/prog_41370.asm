; DESCRIPTION: Places a green line segment connecting (406, 145) to (376, 22).
; PLAN: r0=406(x1), r1=145(y1), r2=376(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 145
LDI r2, 376
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
