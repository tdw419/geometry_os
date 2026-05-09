; DESCRIPTION: Renders a orange line between points (63, 97) and (267, 168).
; PLAN: r0=63(x1), r1=97(y1), r2=267(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 97
LDI r2, 267
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
