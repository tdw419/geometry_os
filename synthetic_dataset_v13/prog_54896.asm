; DESCRIPTION: Renders a black line between points (377, 221) and (51, 93).
; PLAN: r0=377(x1), r1=221(y1), r2=51(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 221
LDI r2, 51
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
