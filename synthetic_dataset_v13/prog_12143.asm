; DESCRIPTION: Renders a purple line between points (497, 188) and (131, 12).
; PLAN: r0=497(x1), r1=188(y1), r2=131(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 188
LDI r2, 131
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
