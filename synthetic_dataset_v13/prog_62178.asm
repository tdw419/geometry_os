; DESCRIPTION: Places a orange line segment connecting (360, 237) to (411, 21).
; PLAN: r0=360(x1), r1=237(y1), r2=411(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 237
LDI r2, 411
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
