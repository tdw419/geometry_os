; DESCRIPTION: Renders a black line between points (241, 134) and (475, 102).
; PLAN: r0=241(x1), r1=134(y1), r2=475(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 134
LDI r2, 475
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
