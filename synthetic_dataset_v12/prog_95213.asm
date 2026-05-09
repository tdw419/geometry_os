; DESCRIPTION: Places a orange line segment connecting (96, 248) to (293, 7).
; PLAN: r0=96(x1), r1=248(y1), r2=293(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 248
LDI r2, 293
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
