; DESCRIPTION: Places a red line segment connecting (62, 142) to (495, 226).
; PLAN: r0=62(x1), r1=142(y1), r2=495(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 142
LDI r2, 495
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
