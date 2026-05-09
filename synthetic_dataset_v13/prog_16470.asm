; DESCRIPTION: Places a green line segment connecting (283, 156) to (157, 192).
; PLAN: r0=283(x1), r1=156(y1), r2=157(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 156
LDI r2, 157
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
