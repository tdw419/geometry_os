; DESCRIPTION: Renders a black line between points (461, 36) and (158, 225).
; PLAN: r0=461(x1), r1=36(y1), r2=158(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 36
LDI r2, 158
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
