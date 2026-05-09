; DESCRIPTION: Draws a orange line from (145, 22) to (408, 102).
; PLAN: r0=145(x1), r1=22(y1), r2=408(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 22
LDI r2, 408
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
