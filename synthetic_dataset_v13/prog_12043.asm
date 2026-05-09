; DESCRIPTION: Places a orange line segment connecting (382, 225) to (396, 217).
; PLAN: r0=382(x1), r1=225(y1), r2=396(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 225
LDI r2, 396
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
