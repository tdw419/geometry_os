; DESCRIPTION: Renders a blue disk with center (372, 193) and radius 56.
; PLAN: r0=372(x), r1=193(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 193
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
