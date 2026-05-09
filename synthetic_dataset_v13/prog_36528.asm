; DESCRIPTION: Places a green line segment connecting (313, 78) to (45, 244).
; PLAN: r0=313(x1), r1=78(y1), r2=45(x2), r3=244(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 78
LDI r2, 45
LDI r3, 244
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
