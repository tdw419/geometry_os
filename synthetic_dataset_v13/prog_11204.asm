; DESCRIPTION: Renders a white line between points (306, 58) and (501, 129).
; PLAN: r0=306(x1), r1=58(y1), r2=501(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 58
LDI r2, 501
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
