; DESCRIPTION: Draws a white line from (335, 141) to (494, 207).
; PLAN: r0=335(x1), r1=141(y1), r2=494(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 141
LDI r2, 494
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
