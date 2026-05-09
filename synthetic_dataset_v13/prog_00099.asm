; DESCRIPTION: Renders a white line between points (40, 88) and (273, 248).
; PLAN: r0=40(x1), r1=88(y1), r2=273(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 88
LDI r2, 273
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
