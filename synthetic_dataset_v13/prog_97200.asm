; DESCRIPTION: Places a orange line segment connecting (391, 168) to (332, 189).
; PLAN: r0=391(x1), r1=168(y1), r2=332(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 168
LDI r2, 332
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
