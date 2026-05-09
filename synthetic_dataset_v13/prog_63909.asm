; DESCRIPTION: Renders a white line between points (89, 32) and (310, 148).
; PLAN: r0=89(x1), r1=32(y1), r2=310(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 32
LDI r2, 310
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
