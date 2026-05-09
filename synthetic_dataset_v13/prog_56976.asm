; DESCRIPTION: Renders a purple disk with center (146, 101) and radius 56.
; PLAN: r0=146(x), r1=101(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 101
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
