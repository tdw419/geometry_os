; DESCRIPTION: Places a purple line segment connecting (195, 93) to (447, 197).
; PLAN: r0=195(x1), r1=93(y1), r2=447(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 93
LDI r2, 447
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
