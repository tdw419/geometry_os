; DESCRIPTION: Draws a white line from (471, 190) to (163, 92).
; PLAN: r0=471(x1), r1=190(y1), r2=163(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 190
LDI r2, 163
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
