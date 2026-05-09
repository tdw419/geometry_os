; DESCRIPTION: Draws a white line from (93, 207) to (299, 2).
; PLAN: r0=93(x1), r1=207(y1), r2=299(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 207
LDI r2, 299
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
