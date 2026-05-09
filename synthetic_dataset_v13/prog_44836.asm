; DESCRIPTION: Places a orange line segment connecting (222, 248) to (64, 51).
; PLAN: r0=222(x1), r1=248(y1), r2=64(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 248
LDI r2, 64
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
