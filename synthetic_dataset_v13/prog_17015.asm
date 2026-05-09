; DESCRIPTION: Draws a orange line from (46, 165) to (19, 108).
; PLAN: r0=46(x1), r1=165(y1), r2=19(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 165
LDI r2, 19
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
