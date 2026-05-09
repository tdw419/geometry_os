; DESCRIPTION: Places a orange line segment connecting (332, 21) to (321, 32).
; PLAN: r0=332(x1), r1=21(y1), r2=321(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 21
LDI r2, 321
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
