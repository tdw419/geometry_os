; DESCRIPTION: Draws a white line from (155, 167) to (358, 193).
; PLAN: r0=155(x1), r1=167(y1), r2=358(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 167
LDI r2, 358
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
