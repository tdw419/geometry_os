; DESCRIPTION: Renders a magenta disk with center (141, 164) and radius 74.
; PLAN: r0=141(x), r1=164(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 164
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
