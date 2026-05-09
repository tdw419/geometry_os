; DESCRIPTION: Draws a white line from (477, 251) to (0, 96).
; PLAN: r0=477(x1), r1=251(y1), r2=0(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 251
LDI r2, 0
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
