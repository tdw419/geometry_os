; DESCRIPTION: Draws a white line from (238, 136) to (107, 249).
; PLAN: r0=238(x1), r1=136(y1), r2=107(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 136
LDI r2, 107
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
