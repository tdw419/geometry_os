; DESCRIPTION: Renders a white line between points (390, 98) and (101, 1).
; PLAN: r0=390(x1), r1=98(y1), r2=101(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 98
LDI r2, 101
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
