; DESCRIPTION: Draws a white line from (384, 81) to (425, 217).
; PLAN: r0=384(x1), r1=81(y1), r2=425(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 81
LDI r2, 425
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
