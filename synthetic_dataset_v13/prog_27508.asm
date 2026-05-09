; DESCRIPTION: Draws a black line from (267, 208) to (188, 44).
; PLAN: r0=267(x1), r1=208(y1), r2=188(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 208
LDI r2, 188
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
