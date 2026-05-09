; DESCRIPTION: Draws a purple line from (406, 240) to (286, 81).
; PLAN: r0=406(x1), r1=240(y1), r2=286(x2), r3=81(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 240
LDI r2, 286
LDI r3, 81
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
