; DESCRIPTION: Places a green line segment connecting (495, 61) to (388, 225).
; PLAN: r0=495(x1), r1=61(y1), r2=388(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 61
LDI r2, 388
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
