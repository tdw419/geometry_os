; DESCRIPTION: Renders a purple disk with center (393, 111) and radius 57.
; PLAN: r0=393(x), r1=111(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 111
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
