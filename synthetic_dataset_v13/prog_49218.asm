; DESCRIPTION: Places a green line segment connecting (451, 188) to (66, 246).
; PLAN: r0=451(x1), r1=188(y1), r2=66(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 188
LDI r2, 66
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
