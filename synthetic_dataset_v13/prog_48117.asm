; DESCRIPTION: Draws a orange line from (60, 153) to (414, 78).
; PLAN: r0=60(x1), r1=153(y1), r2=414(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 153
LDI r2, 414
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
