; DESCRIPTION: Places a white line segment connecting (246, 23) to (491, 118).
; PLAN: r0=246(x1), r1=23(y1), r2=491(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 23
LDI r2, 491
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
