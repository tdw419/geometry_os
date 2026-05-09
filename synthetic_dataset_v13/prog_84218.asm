; DESCRIPTION: Renders a white line between points (287, 217) and (130, 52).
; PLAN: r0=287(x1), r1=217(y1), r2=130(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 217
LDI r2, 130
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
