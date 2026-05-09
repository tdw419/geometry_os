; DESCRIPTION: Draws a orange line from (441, 161) to (492, 149).
; PLAN: r0=441(x1), r1=161(y1), r2=492(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 161
LDI r2, 492
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
