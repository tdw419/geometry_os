; DESCRIPTION: Places a green line segment connecting (316, 11) to (496, 187).
; PLAN: r0=316(x1), r1=11(y1), r2=496(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 11
LDI r2, 496
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
