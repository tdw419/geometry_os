; DESCRIPTION: Renders a white line between points (427, 97) and (11, 200).
; PLAN: r0=427(x1), r1=97(y1), r2=11(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 97
LDI r2, 11
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
