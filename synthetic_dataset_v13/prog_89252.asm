; DESCRIPTION: Renders a magenta disk with center (181, 221) and radius 14.
; PLAN: r0=181(x), r1=221(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 221
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
