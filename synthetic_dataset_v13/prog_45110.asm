; DESCRIPTION: Renders a black line between points (411, 166) and (181, 121).
; PLAN: r0=411(x1), r1=166(y1), r2=181(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 166
LDI r2, 181
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
