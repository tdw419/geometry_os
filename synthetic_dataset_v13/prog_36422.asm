; DESCRIPTION: Places a orange line segment connecting (340, 22) to (139, 16).
; PLAN: r0=340(x1), r1=22(y1), r2=139(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 22
LDI r2, 139
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
