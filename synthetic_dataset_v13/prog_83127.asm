; DESCRIPTION: Places a orange line segment connecting (129, 111) to (447, 25).
; PLAN: r0=129(x1), r1=111(y1), r2=447(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 111
LDI r2, 447
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
