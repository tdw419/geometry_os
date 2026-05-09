; DESCRIPTION: Places a green line segment connecting (31, 33) to (283, 97).
; PLAN: r0=31(x1), r1=33(y1), r2=283(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 33
LDI r2, 283
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
