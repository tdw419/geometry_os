; DESCRIPTION: Places a orange line segment connecting (296, 204) to (193, 22).
; PLAN: r0=296(x1), r1=204(y1), r2=193(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 204
LDI r2, 193
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
