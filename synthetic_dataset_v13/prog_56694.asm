; DESCRIPTION: Draws a white line from (339, 211) to (508, 53).
; PLAN: r0=339(x1), r1=211(y1), r2=508(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 211
LDI r2, 508
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
