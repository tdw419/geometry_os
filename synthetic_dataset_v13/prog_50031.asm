; DESCRIPTION: Places a purple line segment connecting (394, 85) to (337, 159).
; PLAN: r0=394(x1), r1=85(y1), r2=337(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 85
LDI r2, 337
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
