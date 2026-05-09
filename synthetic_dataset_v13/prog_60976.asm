; DESCRIPTION: Places a orange line segment connecting (332, 136) to (153, 202).
; PLAN: r0=332(x1), r1=136(y1), r2=153(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 136
LDI r2, 153
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
