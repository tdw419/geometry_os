; DESCRIPTION: Renders a purple line between points (467, 197) and (185, 23).
; PLAN: r0=467(x1), r1=197(y1), r2=185(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 197
LDI r2, 185
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
