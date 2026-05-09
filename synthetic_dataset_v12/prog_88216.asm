; DESCRIPTION: Renders a blue disk with center (419, 80) and radius 42.
; PLAN: r0=419(x), r1=80(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 80
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
