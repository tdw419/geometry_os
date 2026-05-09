; DESCRIPTION: Draws a orange line from (247, 138) to (391, 79).
; PLAN: r0=247(x1), r1=138(y1), r2=391(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 138
LDI r2, 391
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
