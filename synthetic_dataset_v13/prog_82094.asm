; DESCRIPTION: Places a orange line segment connecting (21, 40) to (282, 8).
; PLAN: r0=21(x1), r1=40(y1), r2=282(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 40
LDI r2, 282
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
