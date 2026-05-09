; DESCRIPTION: Places a orange line segment connecting (0, 2) to (330, 65).
; PLAN: r0=0(x1), r1=2(y1), r2=330(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 2
LDI r2, 330
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
