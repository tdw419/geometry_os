; DESCRIPTION: Places a green line segment connecting (170, 155) to (451, 174).
; PLAN: r0=170(x1), r1=155(y1), r2=451(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 155
LDI r2, 451
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
