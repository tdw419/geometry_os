; DESCRIPTION: Renders a white line between points (427, 102) and (353, 114).
; PLAN: r0=427(x1), r1=102(y1), r2=353(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 102
LDI r2, 353
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
