; DESCRIPTION: Places a green line segment connecting (495, 25) to (33, 250).
; PLAN: r0=495(x1), r1=25(y1), r2=33(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 25
LDI r2, 33
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
