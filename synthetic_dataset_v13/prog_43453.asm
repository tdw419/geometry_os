; DESCRIPTION: Draws a orange line from (234, 165) to (106, 24).
; PLAN: r0=234(x1), r1=165(y1), r2=106(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 165
LDI r2, 106
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
