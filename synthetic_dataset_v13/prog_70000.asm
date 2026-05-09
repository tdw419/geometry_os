; DESCRIPTION: Places a purple line segment connecting (346, 79) to (456, 190).
; PLAN: r0=346(x1), r1=79(y1), r2=456(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 79
LDI r2, 456
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
