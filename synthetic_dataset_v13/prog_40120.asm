; DESCRIPTION: Draws a white line from (400, 183) to (378, 62).
; PLAN: r0=400(x1), r1=183(y1), r2=378(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 183
LDI r2, 378
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
