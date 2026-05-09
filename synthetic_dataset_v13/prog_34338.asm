; DESCRIPTION: Draws a orange line from (86, 40) to (267, 23).
; PLAN: r0=86(x1), r1=40(y1), r2=267(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 40
LDI r2, 267
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
