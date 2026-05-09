; DESCRIPTION: Renders a white line between points (181, 35) and (467, 77).
; PLAN: r0=181(x1), r1=35(y1), r2=467(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 35
LDI r2, 467
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
