; DESCRIPTION: Draws a purple line from (318, 240) to (225, 241).
; PLAN: r0=318(x1), r1=240(y1), r2=225(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 240
LDI r2, 225
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
