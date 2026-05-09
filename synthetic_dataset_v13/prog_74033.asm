; DESCRIPTION: Places a orange line segment connecting (51, 7) to (256, 248).
; PLAN: r0=51(x1), r1=7(y1), r2=256(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 7
LDI r2, 256
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
