; DESCRIPTION: Renders a white line between points (427, 148) and (66, 58).
; PLAN: r0=427(x1), r1=148(y1), r2=66(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 148
LDI r2, 66
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
