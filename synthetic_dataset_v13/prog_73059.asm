; DESCRIPTION: Draws a white line from (417, 52) to (378, 8).
; PLAN: r0=417(x1), r1=52(y1), r2=378(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 52
LDI r2, 378
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
