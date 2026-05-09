; DESCRIPTION: Draws a white line from (486, 115) to (186, 232).
; PLAN: r0=486(x1), r1=115(y1), r2=186(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 115
LDI r2, 186
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
