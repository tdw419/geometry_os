; DESCRIPTION: Renders a purple disk with center (224, 111) and radius 16.
; PLAN: r0=224(x), r1=111(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 111
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
