; DESCRIPTION: Places a blue line segment connecting (372, 106) to (406, 1).
; PLAN: r0=372(x1), r1=106(y1), r2=406(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 106
LDI r2, 406
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
