; DESCRIPTION: Renders a white line between points (88, 101) and (415, 201).
; PLAN: r0=88(x1), r1=101(y1), r2=415(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 101
LDI r2, 415
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
