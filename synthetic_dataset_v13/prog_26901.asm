; DESCRIPTION: Places a green line segment connecting (36, 62) to (97, 158).
; PLAN: r0=36(x1), r1=62(y1), r2=97(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 62
LDI r2, 97
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
