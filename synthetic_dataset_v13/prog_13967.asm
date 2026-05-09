; DESCRIPTION: Places a orange line segment connecting (341, 81) to (197, 25).
; PLAN: r0=341(x1), r1=81(y1), r2=197(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 81
LDI r2, 197
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
