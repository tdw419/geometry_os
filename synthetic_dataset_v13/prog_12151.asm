; DESCRIPTION: Renders a purple disk with center (265, 146) and radius 11.
; PLAN: r0=265(x), r1=146(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 146
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
