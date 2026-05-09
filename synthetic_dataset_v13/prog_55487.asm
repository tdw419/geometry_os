; DESCRIPTION: Places a orange line segment connecting (114, 111) to (245, 217).
; PLAN: r0=114(x1), r1=111(y1), r2=245(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 111
LDI r2, 245
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
