; DESCRIPTION: Places a white line segment connecting (323, 125) to (496, 165).
; PLAN: r0=323(x1), r1=125(y1), r2=496(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 125
LDI r2, 496
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
