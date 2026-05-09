; DESCRIPTION: Places a green line segment connecting (244, 192) to (18, 191).
; PLAN: r0=244(x1), r1=192(y1), r2=18(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 192
LDI r2, 18
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
