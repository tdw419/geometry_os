; DESCRIPTION: Draws a purple line from (178, 87) to (238, 251).
; PLAN: r0=178(x1), r1=87(y1), r2=238(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 87
LDI r2, 238
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
