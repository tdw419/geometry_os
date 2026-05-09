; DESCRIPTION: Places a green line segment connecting (333, 62) to (457, 8).
; PLAN: r0=333(x1), r1=62(y1), r2=457(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 62
LDI r2, 457
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
