; DESCRIPTION: Renders a white line between points (230, 7) and (483, 102).
; PLAN: r0=230(x1), r1=7(y1), r2=483(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 7
LDI r2, 483
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
