; DESCRIPTION: Places a orange line segment connecting (246, 176) to (2, 28).
; PLAN: r0=246(x1), r1=176(y1), r2=2(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 176
LDI r2, 2
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
