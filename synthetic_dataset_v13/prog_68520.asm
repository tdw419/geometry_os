; DESCRIPTION: Draws a purple line from (165, 24) to (510, 226).
; PLAN: r0=165(x1), r1=24(y1), r2=510(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 24
LDI r2, 510
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
