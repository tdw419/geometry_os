; DESCRIPTION: Draws a white line from (437, 14) to (454, 245).
; PLAN: r0=437(x1), r1=14(y1), r2=454(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 14
LDI r2, 454
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
