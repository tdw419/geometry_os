; DESCRIPTION: Places a orange line segment connecting (384, 81) to (391, 29).
; PLAN: r0=384(x1), r1=81(y1), r2=391(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 81
LDI r2, 391
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
