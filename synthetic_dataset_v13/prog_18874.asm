; DESCRIPTION: Places a yellow line segment connecting (347, 15) to (23, 178).
; PLAN: r0=347(x1), r1=15(y1), r2=23(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 15
LDI r2, 23
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
