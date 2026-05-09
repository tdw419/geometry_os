; DESCRIPTION: Draws a white line from (140, 241) to (93, 131).
; PLAN: r0=140(x1), r1=241(y1), r2=93(x2), r3=131(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 241
LDI r2, 93
LDI r3, 131
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
