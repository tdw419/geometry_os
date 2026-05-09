; DESCRIPTION: Places a orange line segment connecting (53, 149) to (130, 178).
; PLAN: r0=53(x1), r1=149(y1), r2=130(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 149
LDI r2, 130
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
