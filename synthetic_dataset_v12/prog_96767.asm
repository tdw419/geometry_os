; DESCRIPTION: Renders a yellow line between points (343, 43) and (121, 217).
; PLAN: r0=343(x1), r1=43(y1), r2=121(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 43
LDI r2, 121
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
