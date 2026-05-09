; DESCRIPTION: Places a blue line segment connecting (266, 43) to (367, 7).
; PLAN: r0=266(x1), r1=43(y1), r2=367(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 43
LDI r2, 367
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
