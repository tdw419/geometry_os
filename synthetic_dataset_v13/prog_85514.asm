; DESCRIPTION: Places a green line segment connecting (261, 66) to (411, 227).
; PLAN: r0=261(x1), r1=66(y1), r2=411(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 66
LDI r2, 411
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
