; DESCRIPTION: Places a orange line segment connecting (491, 197) to (505, 11).
; PLAN: r0=491(x1), r1=197(y1), r2=505(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 197
LDI r2, 505
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
