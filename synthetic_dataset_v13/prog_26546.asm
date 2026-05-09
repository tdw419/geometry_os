; DESCRIPTION: Renders a magenta disk with center (358, 128) and radius 18.
; PLAN: r0=358(x), r1=128(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 128
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
