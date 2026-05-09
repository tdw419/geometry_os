; DESCRIPTION: Draws a white line from (378, 175) to (81, 197).
; PLAN: r0=378(x1), r1=175(y1), r2=81(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 175
LDI r2, 81
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
