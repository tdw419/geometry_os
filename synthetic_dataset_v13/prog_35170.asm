; DESCRIPTION: Draws a magenta line from (497, 43) to (55, 108).
; PLAN: r0=497(x1), r1=43(y1), r2=55(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 43
LDI r2, 55
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
