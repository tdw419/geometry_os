; DESCRIPTION: Renders a magenta line between points (396, 49) and (427, 239).
; PLAN: r0=396(x1), r1=49(y1), r2=427(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 49
LDI r2, 427
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
