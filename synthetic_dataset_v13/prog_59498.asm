; DESCRIPTION: Draws a orange line from (125, 234) to (208, 248).
; PLAN: r0=125(x1), r1=234(y1), r2=208(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 234
LDI r2, 208
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
