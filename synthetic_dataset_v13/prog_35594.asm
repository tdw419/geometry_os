; DESCRIPTION: Renders a black line between points (43, 182) and (74, 197).
; PLAN: r0=43(x1), r1=182(y1), r2=74(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 182
LDI r2, 74
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
