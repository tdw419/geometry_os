; DESCRIPTION: Places a green line segment connecting (299, 172) to (97, 80).
; PLAN: r0=299(x1), r1=172(y1), r2=97(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 172
LDI r2, 97
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
