; DESCRIPTION: Renders a white line between points (153, 20) and (427, 115).
; PLAN: r0=153(x1), r1=20(y1), r2=427(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 20
LDI r2, 427
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
