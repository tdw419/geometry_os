; DESCRIPTION: Draws a orange line from (55, 39) to (175, 249).
; PLAN: r0=55(x1), r1=39(y1), r2=175(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 39
LDI r2, 175
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
