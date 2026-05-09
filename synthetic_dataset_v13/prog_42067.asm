; DESCRIPTION: Places a orange line segment connecting (136, 157) to (248, 209).
; PLAN: r0=136(x1), r1=157(y1), r2=248(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 157
LDI r2, 248
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
