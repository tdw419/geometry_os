; DESCRIPTION: Draws a white line from (378, 96) to (466, 23).
; PLAN: r0=378(x1), r1=96(y1), r2=466(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 96
LDI r2, 466
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
