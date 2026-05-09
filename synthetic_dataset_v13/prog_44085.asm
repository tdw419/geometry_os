; DESCRIPTION: Draws a orange line from (475, 55) to (373, 100).
; PLAN: r0=475(x1), r1=55(y1), r2=373(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 55
LDI r2, 373
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
