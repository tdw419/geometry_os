; DESCRIPTION: Places a orange line segment connecting (139, 150) to (130, 195).
; PLAN: r0=139(x1), r1=150(y1), r2=130(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 150
LDI r2, 130
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
