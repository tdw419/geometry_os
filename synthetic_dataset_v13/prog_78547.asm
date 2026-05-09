; DESCRIPTION: Draws a purple line from (441, 8) to (421, 241).
; PLAN: r0=441(x1), r1=8(y1), r2=421(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 8
LDI r2, 421
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
