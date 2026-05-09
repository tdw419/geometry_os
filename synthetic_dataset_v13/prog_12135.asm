; DESCRIPTION: Draws a blue line from (31, 213) to (19, 97).
; PLAN: r0=31(x1), r1=213(y1), r2=19(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 213
LDI r2, 19
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
