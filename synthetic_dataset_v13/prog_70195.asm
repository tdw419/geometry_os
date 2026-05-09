; DESCRIPTION: Renders a magenta disk with center (111, 83) and radius 49.
; PLAN: r0=111(x), r1=83(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 83
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
