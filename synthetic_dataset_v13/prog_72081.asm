; DESCRIPTION: Places a green line segment connecting (351, 212) to (21, 26).
; PLAN: r0=351(x1), r1=212(y1), r2=21(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 212
LDI r2, 21
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
