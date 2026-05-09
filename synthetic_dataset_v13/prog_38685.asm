; DESCRIPTION: Draws a purple line from (213, 108) to (286, 167).
; PLAN: r0=213(x1), r1=108(y1), r2=286(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 108
LDI r2, 286
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
