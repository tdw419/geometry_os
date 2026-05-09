; DESCRIPTION: Places a blue line segment connecting (496, 233) to (47, 43).
; PLAN: r0=496(x1), r1=233(y1), r2=47(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 233
LDI r2, 47
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
