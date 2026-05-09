; DESCRIPTION: Renders a white line between points (452, 11) and (486, 248).
; PLAN: r0=452(x1), r1=11(y1), r2=486(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 11
LDI r2, 486
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
