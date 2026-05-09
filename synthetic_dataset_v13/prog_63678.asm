; DESCRIPTION: Renders a white line between points (265, 11) and (200, 194).
; PLAN: r0=265(x1), r1=11(y1), r2=200(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 11
LDI r2, 200
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
