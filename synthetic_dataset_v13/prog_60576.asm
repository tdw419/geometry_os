; DESCRIPTION: Places a green line segment connecting (236, 49) to (463, 232).
; PLAN: r0=236(x1), r1=49(y1), r2=463(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 49
LDI r2, 463
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
