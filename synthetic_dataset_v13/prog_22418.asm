; DESCRIPTION: Renders a black line between points (494, 200) and (82, 194).
; PLAN: r0=494(x1), r1=200(y1), r2=82(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 200
LDI r2, 82
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
