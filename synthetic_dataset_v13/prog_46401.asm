; DESCRIPTION: Places a orange line segment connecting (208, 134) to (240, 137).
; PLAN: r0=208(x1), r1=134(y1), r2=240(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 134
LDI r2, 240
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
