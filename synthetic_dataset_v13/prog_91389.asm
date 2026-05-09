; DESCRIPTION: Draws a orange line from (172, 72) to (369, 154).
; PLAN: r0=172(x1), r1=72(y1), r2=369(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 72
LDI r2, 369
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
