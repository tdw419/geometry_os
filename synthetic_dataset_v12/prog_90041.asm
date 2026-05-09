; DESCRIPTION: Renders a magenta disk with center (307, 62) and radius 32.
; PLAN: r0=307(x), r1=62(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 62
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
