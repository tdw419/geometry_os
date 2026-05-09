; DESCRIPTION: Places a orange line segment connecting (198, 14) to (497, 202).
; PLAN: r0=198(x1), r1=14(y1), r2=497(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 14
LDI r2, 497
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
