; DESCRIPTION: Draws a orange line from (114, 175) to (83, 135).
; PLAN: r0=114(x1), r1=175(y1), r2=83(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 175
LDI r2, 83
LDI r3, 135
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
