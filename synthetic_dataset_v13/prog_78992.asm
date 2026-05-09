; DESCRIPTION: Draws a white line from (109, 182) to (390, 94).
; PLAN: r0=109(x1), r1=182(y1), r2=390(x2), r3=94(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 182
LDI r2, 390
LDI r3, 94
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
