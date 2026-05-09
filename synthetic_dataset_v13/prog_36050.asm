; DESCRIPTION: Renders a magenta disk with center (336, 195) and radius 10.
; PLAN: r0=336(x), r1=195(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 195
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
