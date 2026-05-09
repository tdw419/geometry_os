; DESCRIPTION: Renders a magenta line between points (232, 9) and (497, 32).
; PLAN: r0=232(x1), r1=9(y1), r2=497(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 9
LDI r2, 497
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
