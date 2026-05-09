; DESCRIPTION: Places a yellow line segment connecting (159, 197) to (390, 47).
; PLAN: r0=159(x1), r1=197(y1), r2=390(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 197
LDI r2, 390
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
