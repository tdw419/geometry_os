; DESCRIPTION: Renders a magenta disk with center (459, 99) and radius 53.
; PLAN: r0=459(x), r1=99(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 99
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
