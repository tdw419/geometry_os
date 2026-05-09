; DESCRIPTION: Renders a black line between points (289, 241) and (33, 102).
; PLAN: r0=289(x1), r1=241(y1), r2=33(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 241
LDI r2, 33
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
