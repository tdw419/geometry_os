; DESCRIPTION: Draws a purple line from (395, 115) to (467, 156).
; PLAN: r0=395(x1), r1=115(y1), r2=467(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 115
LDI r2, 467
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
