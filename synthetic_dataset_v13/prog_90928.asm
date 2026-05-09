; DESCRIPTION: Places a green line segment connecting (495, 165) to (474, 79).
; PLAN: r0=495(x1), r1=165(y1), r2=474(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 165
LDI r2, 474
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
