; DESCRIPTION: Renders a magenta disk with center (310, 168) and radius 18.
; PLAN: r0=310(x), r1=168(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 168
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
