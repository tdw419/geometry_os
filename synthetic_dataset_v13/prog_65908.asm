; DESCRIPTION: Places a orange line segment connecting (447, 195) to (40, 234).
; PLAN: r0=447(x1), r1=195(y1), r2=40(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 195
LDI r2, 40
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
