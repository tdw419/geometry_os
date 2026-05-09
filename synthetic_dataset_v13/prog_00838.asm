; DESCRIPTION: Draws a orange line from (5, 204) to (19, 154).
; PLAN: r0=5(x1), r1=204(y1), r2=19(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 204
LDI r2, 19
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
