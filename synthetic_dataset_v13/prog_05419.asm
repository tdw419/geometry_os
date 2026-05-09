; DESCRIPTION: Places a orange line segment connecting (341, 254) to (178, 202).
; PLAN: r0=341(x1), r1=254(y1), r2=178(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 254
LDI r2, 178
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
