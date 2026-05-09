; DESCRIPTION: Renders a blue line between points (195, 97) and (497, 222).
; PLAN: r0=195(x1), r1=97(y1), r2=497(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 97
LDI r2, 497
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
