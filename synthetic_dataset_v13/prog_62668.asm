; DESCRIPTION: Renders a purple disk with center (346, 111) and radius 24.
; PLAN: r0=346(x), r1=111(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 111
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
