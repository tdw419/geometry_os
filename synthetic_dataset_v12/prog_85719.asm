; DESCRIPTION: Renders a magenta disk with center (88, 221) and radius 28.
; PLAN: r0=88(x), r1=221(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 221
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
