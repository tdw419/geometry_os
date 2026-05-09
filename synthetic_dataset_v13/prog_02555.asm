; DESCRIPTION: Renders a black line between points (141, 43) and (55, 249).
; PLAN: r0=141(x1), r1=43(y1), r2=55(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 43
LDI r2, 55
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
