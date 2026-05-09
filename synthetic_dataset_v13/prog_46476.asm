; DESCRIPTION: Draws a purple line from (385, 171) to (441, 170).
; PLAN: r0=385(x1), r1=171(y1), r2=441(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 171
LDI r2, 441
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
