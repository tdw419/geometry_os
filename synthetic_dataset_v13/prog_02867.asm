; DESCRIPTION: Renders a magenta disk with center (423, 164) and radius 64.
; PLAN: r0=423(x), r1=164(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 164
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
