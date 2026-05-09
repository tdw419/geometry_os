; DESCRIPTION: Draws a purple line from (497, 167) to (403, 83).
; PLAN: r0=497(x1), r1=167(y1), r2=403(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 167
LDI r2, 403
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
