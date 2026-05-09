; DESCRIPTION: Places a purple line segment connecting (79, 154) to (436, 233).
; PLAN: r0=79(x1), r1=154(y1), r2=436(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 154
LDI r2, 436
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
