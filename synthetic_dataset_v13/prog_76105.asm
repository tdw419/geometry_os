; DESCRIPTION: Draws a magenta line from (50, 110) to (267, 253).
; PLAN: r0=50(x1), r1=110(y1), r2=267(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 110
LDI r2, 267
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
