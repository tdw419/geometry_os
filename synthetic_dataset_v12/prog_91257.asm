; DESCRIPTION: Places a blue line segment connecting (244, 58) to (17, 166).
; PLAN: r0=244(x1), r1=58(y1), r2=17(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 58
LDI r2, 17
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
