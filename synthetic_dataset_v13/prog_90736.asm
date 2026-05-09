; DESCRIPTION: Draws a orange line from (166, 137) to (14, 9).
; PLAN: r0=166(x1), r1=137(y1), r2=14(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 137
LDI r2, 14
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
