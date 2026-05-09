; DESCRIPTION: Places a orange line segment connecting (396, 38) to (361, 91).
; PLAN: r0=396(x1), r1=38(y1), r2=361(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 38
LDI r2, 361
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
