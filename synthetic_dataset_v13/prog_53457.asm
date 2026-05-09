; DESCRIPTION: Draws a purple line from (65, 141) to (275, 145).
; PLAN: r0=65(x1), r1=141(y1), r2=275(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 141
LDI r2, 275
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
