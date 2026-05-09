; DESCRIPTION: Places a red line segment connecting (181, 123) to (45, 12).
; PLAN: r0=181(x1), r1=123(y1), r2=45(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 123
LDI r2, 45
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
