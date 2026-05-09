; DESCRIPTION: Draws a orange line from (27, 79) to (431, 157).
; PLAN: r0=27(x1), r1=79(y1), r2=431(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 79
LDI r2, 431
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
