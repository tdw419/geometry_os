; DESCRIPTION: Draws a orange line from (217, 141) to (101, 65).
; PLAN: r0=217(x1), r1=141(y1), r2=101(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 141
LDI r2, 101
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
