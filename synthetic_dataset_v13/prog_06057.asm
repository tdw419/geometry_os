; DESCRIPTION: Draws a orange line from (421, 148) to (490, 154).
; PLAN: r0=421(x1), r1=148(y1), r2=490(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 148
LDI r2, 490
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
