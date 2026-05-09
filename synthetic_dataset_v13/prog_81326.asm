; DESCRIPTION: Draws a purple line from (98, 79) to (480, 185).
; PLAN: r0=98(x1), r1=79(y1), r2=480(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 79
LDI r2, 480
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
