; DESCRIPTION: Places a orange line segment connecting (491, 143) to (374, 24).
; PLAN: r0=491(x1), r1=143(y1), r2=374(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 143
LDI r2, 374
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
