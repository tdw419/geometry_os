; DESCRIPTION: Draws a purple line from (193, 4) to (185, 94).
; PLAN: r0=193(x1), r1=4(y1), r2=185(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 4
LDI r2, 185
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
