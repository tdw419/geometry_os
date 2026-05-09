; DESCRIPTION: Draws a white line from (37, 140) to (17, 232).
; PLAN: r0=37(x1), r1=140(y1), r2=17(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 140
LDI r2, 17
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
