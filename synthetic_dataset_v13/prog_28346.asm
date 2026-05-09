; DESCRIPTION: Draws a purple line from (266, 97) to (205, 55).
; PLAN: r0=266(x1), r1=97(y1), r2=205(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 97
LDI r2, 205
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
