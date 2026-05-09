; DESCRIPTION: Renders a orange line between points (267, 57) and (132, 9).
; PLAN: r0=267(x1), r1=57(y1), r2=132(x2), r3=9(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 57
LDI r2, 132
LDI r3, 9
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
