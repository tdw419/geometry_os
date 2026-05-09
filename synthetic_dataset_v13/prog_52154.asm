; DESCRIPTION: Places a orange line segment connecting (89, 36) to (498, 195).
; PLAN: r0=89(x1), r1=36(y1), r2=498(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 36
LDI r2, 498
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
