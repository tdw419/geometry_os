; DESCRIPTION: Renders a white line between points (306, 88) and (331, 188).
; PLAN: r0=306(x1), r1=88(y1), r2=331(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 88
LDI r2, 331
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
