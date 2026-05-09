; DESCRIPTION: Renders a purple disk with center (333, 146) and radius 51.
; PLAN: r0=333(x), r1=146(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 146
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
