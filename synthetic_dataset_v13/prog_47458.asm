; DESCRIPTION: Renders a green line between points (6, 164) and (51, 238).
; PLAN: r0=6(x1), r1=164(y1), r2=51(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 164
LDI r2, 51
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
