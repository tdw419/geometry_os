; DESCRIPTION: Renders a black line between points (309, 138) and (248, 155).
; PLAN: r0=309(x1), r1=138(y1), r2=248(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 138
LDI r2, 248
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
