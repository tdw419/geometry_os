; DESCRIPTION: Renders a white line between points (508, 14) and (378, 53).
; PLAN: r0=508(x1), r1=14(y1), r2=378(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 14
LDI r2, 378
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
