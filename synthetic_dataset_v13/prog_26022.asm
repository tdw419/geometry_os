; DESCRIPTION: Places a black line segment connecting (451, 232) to (338, 150).
; PLAN: r0=451(x1), r1=232(y1), r2=338(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 232
LDI r2, 338
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
