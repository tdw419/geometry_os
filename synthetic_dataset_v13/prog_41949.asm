; DESCRIPTION: Draws a purple line from (429, 93) to (115, 140).
; PLAN: r0=429(x1), r1=93(y1), r2=115(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 93
LDI r2, 115
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
