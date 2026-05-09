; DESCRIPTION: Renders a purple disk with center (475, 146) and radius 34.
; PLAN: r0=475(x), r1=146(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 475
LDI r1, 146
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
