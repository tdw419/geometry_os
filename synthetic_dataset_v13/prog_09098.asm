; DESCRIPTION: Renders a white line between points (427, 33) and (469, 118).
; PLAN: r0=427(x1), r1=33(y1), r2=469(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 33
LDI r2, 469
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
