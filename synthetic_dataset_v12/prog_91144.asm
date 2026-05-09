; DESCRIPTION: Places a green line segment connecting (15, 167) to (508, 81).
; PLAN: r0=15(x1), r1=167(y1), r2=508(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 167
LDI r2, 508
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
