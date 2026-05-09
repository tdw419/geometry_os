; DESCRIPTION: Draws a orange line from (101, 189) to (303, 66).
; PLAN: r0=101(x1), r1=189(y1), r2=303(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 189
LDI r2, 303
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
