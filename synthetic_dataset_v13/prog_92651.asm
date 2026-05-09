; DESCRIPTION: Places a orange line segment connecting (148, 82) to (406, 179).
; PLAN: r0=148(x1), r1=82(y1), r2=406(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 82
LDI r2, 406
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
