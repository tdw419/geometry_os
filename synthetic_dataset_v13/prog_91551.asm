; DESCRIPTION: Places a orange line segment connecting (257, 231) to (296, 165).
; PLAN: r0=257(x1), r1=231(y1), r2=296(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 231
LDI r2, 296
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
