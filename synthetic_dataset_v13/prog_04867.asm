; DESCRIPTION: Places a green line segment connecting (97, 237) to (258, 160).
; PLAN: r0=97(x1), r1=237(y1), r2=258(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 237
LDI r2, 258
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
