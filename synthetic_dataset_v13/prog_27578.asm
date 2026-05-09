; DESCRIPTION: Places a green line segment connecting (244, 0) to (1, 175).
; PLAN: r0=244(x1), r1=0(y1), r2=1(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 0
LDI r2, 1
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
