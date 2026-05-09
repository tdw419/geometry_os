; DESCRIPTION: Places a purple line segment connecting (503, 195) to (139, 79).
; PLAN: r0=503(x1), r1=195(y1), r2=139(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 195
LDI r2, 139
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
