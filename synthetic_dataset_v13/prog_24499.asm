; DESCRIPTION: Draws a red line from (441, 167) to (310, 246).
; PLAN: r0=441(x1), r1=167(y1), r2=310(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 167
LDI r2, 310
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
