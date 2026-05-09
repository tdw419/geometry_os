; DESCRIPTION: Renders a black line between points (425, 210) and (372, 238).
; PLAN: r0=425(x1), r1=210(y1), r2=372(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 210
LDI r2, 372
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
