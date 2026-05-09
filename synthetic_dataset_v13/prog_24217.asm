; DESCRIPTION: Draws a white line from (467, 29) to (139, 230).
; PLAN: r0=467(x1), r1=29(y1), r2=139(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 29
LDI r2, 139
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
