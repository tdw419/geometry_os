; DESCRIPTION: Places a green line segment connecting (181, 16) to (427, 245).
; PLAN: r0=181(x1), r1=16(y1), r2=427(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 16
LDI r2, 427
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
