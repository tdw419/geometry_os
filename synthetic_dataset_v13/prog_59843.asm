; DESCRIPTION: Places a green line segment connecting (360, 33) to (13, 58).
; PLAN: r0=360(x1), r1=33(y1), r2=13(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 33
LDI r2, 13
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
