; DESCRIPTION: Places a orange line segment connecting (15, 32) to (288, 193).
; PLAN: r0=15(x1), r1=32(y1), r2=288(x2), r3=193(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 32
LDI r2, 288
LDI r3, 193
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
