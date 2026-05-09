; DESCRIPTION: Places a yellow line segment connecting (318, 212) to (44, 60).
; PLAN: r0=318(x1), r1=212(y1), r2=44(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 212
LDI r2, 44
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
