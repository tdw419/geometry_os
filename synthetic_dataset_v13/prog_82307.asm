; DESCRIPTION: Places a yellow line segment connecting (263, 86) to (508, 136).
; PLAN: r0=263(x1), r1=86(y1), r2=508(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 86
LDI r2, 508
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
