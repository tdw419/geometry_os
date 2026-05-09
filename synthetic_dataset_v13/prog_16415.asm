; DESCRIPTION: Places a blue line segment connecting (276, 59) to (409, 155).
; PLAN: r0=276(x1), r1=59(y1), r2=409(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 59
LDI r2, 409
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
