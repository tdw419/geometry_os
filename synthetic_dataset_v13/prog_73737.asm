; DESCRIPTION: Places a red line segment connecting (165, 145) to (491, 39).
; PLAN: r0=165(x1), r1=145(y1), r2=491(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 145
LDI r2, 491
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
