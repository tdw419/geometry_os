; DESCRIPTION: Renders a white line between points (287, 66) and (330, 106).
; PLAN: r0=287(x1), r1=66(y1), r2=330(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 66
LDI r2, 330
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
