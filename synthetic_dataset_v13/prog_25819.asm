; DESCRIPTION: Renders a black line between points (250, 221) and (210, 238).
; PLAN: r0=250(x1), r1=221(y1), r2=210(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 221
LDI r2, 210
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
