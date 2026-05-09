; DESCRIPTION: Places a yellow line segment connecting (232, 75) to (409, 240).
; PLAN: r0=232(x1), r1=75(y1), r2=409(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 75
LDI r2, 409
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
