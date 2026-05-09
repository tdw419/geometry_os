; DESCRIPTION: Places a orange line segment connecting (393, 96) to (199, 204).
; PLAN: r0=393(x1), r1=96(y1), r2=199(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 96
LDI r2, 199
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
