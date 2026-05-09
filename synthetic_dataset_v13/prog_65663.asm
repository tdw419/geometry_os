; DESCRIPTION: Draws a magenta line from (267, 250) to (0, 139).
; PLAN: r0=267(x1), r1=250(y1), r2=0(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 250
LDI r2, 0
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
