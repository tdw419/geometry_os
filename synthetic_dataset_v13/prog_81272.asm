; DESCRIPTION: Places a orange line segment connecting (126, 204) to (188, 24).
; PLAN: r0=126(x1), r1=204(y1), r2=188(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 204
LDI r2, 188
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
