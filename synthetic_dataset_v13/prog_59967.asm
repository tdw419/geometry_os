; DESCRIPTION: Places a orange line segment connecting (500, 204) to (498, 92).
; PLAN: r0=500(x1), r1=204(y1), r2=498(x2), r3=92(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 204
LDI r2, 498
LDI r3, 92
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
