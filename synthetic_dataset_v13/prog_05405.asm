; DESCRIPTION: Renders a orange line between points (267, 48) and (137, 79).
; PLAN: r0=267(x1), r1=48(y1), r2=137(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 48
LDI r2, 137
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
