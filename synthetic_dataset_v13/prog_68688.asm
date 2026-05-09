; DESCRIPTION: Places a orange line segment connecting (198, 248) to (347, 87).
; PLAN: r0=198(x1), r1=248(y1), r2=347(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 248
LDI r2, 347
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
