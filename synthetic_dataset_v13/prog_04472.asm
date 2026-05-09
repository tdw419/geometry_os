; DESCRIPTION: Draws a orange line from (212, 114) to (175, 169).
; PLAN: r0=212(x1), r1=114(y1), r2=175(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 114
LDI r2, 175
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
