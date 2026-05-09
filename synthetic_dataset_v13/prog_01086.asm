; DESCRIPTION: Draws a orange line from (339, 54) to (55, 25).
; PLAN: r0=339(x1), r1=54(y1), r2=55(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 54
LDI r2, 55
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
