; DESCRIPTION: Draws a purple line from (66, 39) to (190, 127).
; PLAN: r0=66(x1), r1=39(y1), r2=190(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 39
LDI r2, 190
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
