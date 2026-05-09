; DESCRIPTION: Places a yellow line segment connecting (225, 229) to (318, 194).
; PLAN: r0=225(x1), r1=229(y1), r2=318(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 229
LDI r2, 318
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
