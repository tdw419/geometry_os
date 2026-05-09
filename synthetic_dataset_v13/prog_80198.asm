; DESCRIPTION: Places a white line segment connecting (296, 13) to (451, 129).
; PLAN: r0=296(x1), r1=13(y1), r2=451(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 13
LDI r2, 451
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
