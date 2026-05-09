; DESCRIPTION: Places a orange line segment connecting (510, 254) to (204, 204).
; PLAN: r0=510(x1), r1=254(y1), r2=204(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 254
LDI r2, 204
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
