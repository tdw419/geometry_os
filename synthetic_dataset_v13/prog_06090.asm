; DESCRIPTION: Draws a yellow line from (163, 175) to (477, 139).
; PLAN: r0=163(x1), r1=175(y1), r2=477(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 175
LDI r2, 477
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
