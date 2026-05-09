; DESCRIPTION: Places a orange line segment connecting (470, 248) to (358, 2).
; PLAN: r0=470(x1), r1=248(y1), r2=358(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 248
LDI r2, 358
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
