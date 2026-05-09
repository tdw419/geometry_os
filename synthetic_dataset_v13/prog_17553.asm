; DESCRIPTION: Places a green line segment connecting (495, 125) to (8, 44).
; PLAN: r0=495(x1), r1=125(y1), r2=8(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 125
LDI r2, 8
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
