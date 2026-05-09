; DESCRIPTION: Renders a magenta disk with center (299, 219) and radius 12.
; PLAN: r0=299(x), r1=219(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 219
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
