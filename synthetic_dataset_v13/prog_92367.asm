; DESCRIPTION: Draws a white line from (11, 163) to (426, 167).
; PLAN: r0=11(x1), r1=163(y1), r2=426(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 163
LDI r2, 426
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
