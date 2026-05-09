; DESCRIPTION: Places a purple line segment connecting (367, 93) to (213, 185).
; PLAN: r0=367(x1), r1=93(y1), r2=213(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 93
LDI r2, 213
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
