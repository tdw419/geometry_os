; DESCRIPTION: Places a orange line segment connecting (296, 166) to (326, 184).
; PLAN: r0=296(x1), r1=166(y1), r2=326(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 166
LDI r2, 326
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
