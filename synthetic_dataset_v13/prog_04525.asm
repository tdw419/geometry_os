; DESCRIPTION: Renders a black line between points (114, 247) and (58, 124).
; PLAN: r0=114(x1), r1=247(y1), r2=58(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 247
LDI r2, 58
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
