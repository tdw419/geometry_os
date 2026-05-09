; DESCRIPTION: Renders a magenta line between points (497, 250) and (289, 62).
; PLAN: r0=497(x1), r1=250(y1), r2=289(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 250
LDI r2, 289
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
