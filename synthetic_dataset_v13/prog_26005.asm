; DESCRIPTION: Draws a white line from (292, 115) to (378, 185).
; PLAN: r0=292(x1), r1=115(y1), r2=378(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 115
LDI r2, 378
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
