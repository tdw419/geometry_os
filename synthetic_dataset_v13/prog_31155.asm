; DESCRIPTION: Renders a black line between points (55, 114) and (24, 248).
; PLAN: r0=55(x1), r1=114(y1), r2=24(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 114
LDI r2, 24
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
