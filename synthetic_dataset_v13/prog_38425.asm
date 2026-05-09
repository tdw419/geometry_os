; DESCRIPTION: Draws a purple line from (273, 81) to (66, 43).
; PLAN: r0=273(x1), r1=81(y1), r2=66(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 81
LDI r2, 66
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
