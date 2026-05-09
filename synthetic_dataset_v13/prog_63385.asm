; DESCRIPTION: Renders a white line between points (122, 92) and (409, 3).
; PLAN: r0=122(x1), r1=92(y1), r2=409(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 92
LDI r2, 409
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
