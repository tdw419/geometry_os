; DESCRIPTION: Draws a purple line from (193, 237) to (211, 17).
; PLAN: r0=193(x1), r1=237(y1), r2=211(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 237
LDI r2, 211
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
