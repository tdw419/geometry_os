; DESCRIPTION: Renders a magenta disk with center (61, 164) and radius 48.
; PLAN: r0=61(x), r1=164(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 164
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
