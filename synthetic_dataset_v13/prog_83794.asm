; DESCRIPTION: Draws a purple line from (309, 35) to (321, 199).
; PLAN: r0=309(x1), r1=35(y1), r2=321(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 35
LDI r2, 321
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
