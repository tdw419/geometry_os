; DESCRIPTION: Places a purple line segment connecting (114, 125) to (246, 32).
; PLAN: r0=114(x1), r1=125(y1), r2=246(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 125
LDI r2, 246
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
