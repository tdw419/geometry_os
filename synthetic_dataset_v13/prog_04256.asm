; DESCRIPTION: Renders a magenta disk with center (81, 224) and radius 16.
; PLAN: r0=81(x), r1=224(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 224
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
