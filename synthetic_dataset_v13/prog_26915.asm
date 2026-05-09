; DESCRIPTION: Draws a purple line from (40, 213) to (25, 195).
; PLAN: r0=40(x1), r1=213(y1), r2=25(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 213
LDI r2, 25
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
