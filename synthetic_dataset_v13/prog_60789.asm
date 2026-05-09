; DESCRIPTION: Renders a green line between points (461, 14) and (467, 0).
; PLAN: r0=461(x1), r1=14(y1), r2=467(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 14
LDI r2, 467
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
