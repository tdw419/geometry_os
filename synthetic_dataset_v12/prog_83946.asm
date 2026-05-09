; DESCRIPTION: Places a purple line segment connecting (87, 79) to (155, 255).
; PLAN: r0=87(x1), r1=79(y1), r2=155(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 79
LDI r2, 155
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
