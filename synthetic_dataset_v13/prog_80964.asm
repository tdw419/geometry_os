; DESCRIPTION: Renders a white line between points (501, 179) and (339, 72).
; PLAN: r0=501(x1), r1=179(y1), r2=339(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 179
LDI r2, 339
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
