; DESCRIPTION: Places a orange line segment connecting (498, 55) to (172, 204).
; PLAN: r0=498(x1), r1=55(y1), r2=172(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 55
LDI r2, 172
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
