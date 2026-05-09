; DESCRIPTION: Draws a white line from (255, 170) to (477, 53).
; PLAN: r0=255(x1), r1=170(y1), r2=477(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 170
LDI r2, 477
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
