; DESCRIPTION: Places a green line segment connecting (13, 62) to (276, 227).
; PLAN: r0=13(x1), r1=62(y1), r2=276(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 62
LDI r2, 276
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
