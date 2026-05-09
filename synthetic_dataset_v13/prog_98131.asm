; DESCRIPTION: Places a orange line segment connecting (273, 32) to (58, 39).
; PLAN: r0=273(x1), r1=32(y1), r2=58(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 32
LDI r2, 58
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
