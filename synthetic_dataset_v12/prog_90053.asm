; DESCRIPTION: Renders a white line between points (336, 97) and (167, 248).
; PLAN: r0=336(x1), r1=97(y1), r2=167(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 97
LDI r2, 167
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
