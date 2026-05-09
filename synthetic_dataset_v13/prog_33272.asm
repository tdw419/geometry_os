; DESCRIPTION: Draws a purple line from (63, 175) to (240, 241).
; PLAN: r0=63(x1), r1=175(y1), r2=240(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 175
LDI r2, 240
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
