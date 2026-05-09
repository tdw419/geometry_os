; DESCRIPTION: Places a orange line segment connecting (125, 58) to (63, 92).
; PLAN: r0=125(x1), r1=58(y1), r2=63(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 58
LDI r2, 63
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
