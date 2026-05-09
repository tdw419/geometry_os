; DESCRIPTION: Places a orange line segment connecting (181, 129) to (199, 103).
; PLAN: r0=181(x1), r1=129(y1), r2=199(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 129
LDI r2, 199
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
