; DESCRIPTION: Draws a purple line from (293, 222) to (65, 188).
; PLAN: r0=293(x1), r1=222(y1), r2=65(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 222
LDI r2, 65
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
