; DESCRIPTION: Draws a red line from (19, 136) to (217, 111).
; PLAN: r0=19(x1), r1=136(y1), r2=217(x2), r3=111(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 136
LDI r2, 217
LDI r3, 111
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
