; DESCRIPTION: Renders a blue disk with center (214, 83) and radius 56.
; PLAN: r0=214(x), r1=83(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 83
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
