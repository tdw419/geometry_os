; DESCRIPTION: Places a red line segment connecting (421, 142) to (508, 99).
; PLAN: r0=421(x1), r1=142(y1), r2=508(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 142
LDI r2, 508
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
