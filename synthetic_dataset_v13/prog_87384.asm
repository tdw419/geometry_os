; DESCRIPTION: Draws a magenta line from (267, 18) to (148, 239).
; PLAN: r0=267(x1), r1=18(y1), r2=148(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 18
LDI r2, 148
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
