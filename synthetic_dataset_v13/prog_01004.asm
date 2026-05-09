; DESCRIPTION: Places a orange line segment connecting (220, 254) to (409, 6).
; PLAN: r0=220(x1), r1=254(y1), r2=409(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 254
LDI r2, 409
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
