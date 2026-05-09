; DESCRIPTION: Renders a white line between points (134, 25) and (139, 88).
; PLAN: r0=134(x1), r1=25(y1), r2=139(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 25
LDI r2, 139
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
