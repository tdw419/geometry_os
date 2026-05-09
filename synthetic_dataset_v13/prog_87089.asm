; DESCRIPTION: Renders a magenta disk with center (238, 99) and radius 36.
; PLAN: r0=238(x), r1=99(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 99
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
