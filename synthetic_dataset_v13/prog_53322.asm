; DESCRIPTION: Renders a white line between points (232, 248) and (511, 43).
; PLAN: r0=232(x1), r1=248(y1), r2=511(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 248
LDI r2, 511
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
