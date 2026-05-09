; DESCRIPTION: Renders a white line between points (74, 90) and (51, 238).
; PLAN: r0=74(x1), r1=90(y1), r2=51(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 90
LDI r2, 51
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
