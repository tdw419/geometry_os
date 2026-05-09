; DESCRIPTION: Places a yellow line segment connecting (232, 98) to (133, 250).
; PLAN: r0=232(x1), r1=98(y1), r2=133(x2), r3=250(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 98
LDI r2, 133
LDI r3, 250
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
