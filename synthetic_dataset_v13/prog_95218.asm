; DESCRIPTION: Places a orange line segment connecting (209, 175) to (469, 136).
; PLAN: r0=209(x1), r1=175(y1), r2=469(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 175
LDI r2, 469
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
