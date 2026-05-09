; DESCRIPTION: Draws a purple line from (75, 221) to (441, 182).
; PLAN: r0=75(x1), r1=221(y1), r2=441(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 221
LDI r2, 441
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
