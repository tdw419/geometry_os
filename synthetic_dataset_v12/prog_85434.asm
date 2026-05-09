; DESCRIPTION: Draws a purple line from (66, 17) to (141, 44).
; PLAN: r0=66(x1), r1=17(y1), r2=141(x2), r3=44(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 17
LDI r2, 141
LDI r3, 44
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
