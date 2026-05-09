; DESCRIPTION: Places a red line segment connecting (229, 167) to (496, 43).
; PLAN: r0=229(x1), r1=167(y1), r2=496(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 167
LDI r2, 496
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
