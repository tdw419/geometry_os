; DESCRIPTION: Places a green line segment connecting (409, 212) to (204, 87).
; PLAN: r0=409(x1), r1=212(y1), r2=204(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 212
LDI r2, 204
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
