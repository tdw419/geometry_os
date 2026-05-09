; DESCRIPTION: Places a purple line segment connecting (246, 85) to (60, 234).
; PLAN: r0=246(x1), r1=85(y1), r2=60(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 85
LDI r2, 60
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
