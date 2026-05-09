; DESCRIPTION: Places a orange line segment connecting (296, 105) to (473, 92).
; PLAN: r0=296(x1), r1=105(y1), r2=473(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 105
LDI r2, 473
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
