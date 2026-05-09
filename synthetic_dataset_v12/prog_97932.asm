; DESCRIPTION: Renders a magenta disk with center (24, 36) and radius 13.
; PLAN: r0=24(x), r1=36(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 24
LDI r1, 36
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
