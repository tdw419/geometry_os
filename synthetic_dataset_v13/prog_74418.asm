; DESCRIPTION: Draws a white line from (378, 219) to (246, 251).
; PLAN: r0=378(x1), r1=219(y1), r2=246(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 219
LDI r2, 246
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
