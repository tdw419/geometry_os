; DESCRIPTION: Draws a orange line from (509, 75) to (407, 127).
; PLAN: r0=509(x1), r1=75(y1), r2=407(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 75
LDI r2, 407
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
