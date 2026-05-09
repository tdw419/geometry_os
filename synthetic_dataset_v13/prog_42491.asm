; DESCRIPTION: Renders a magenta disk with center (108, 224) and radius 28.
; PLAN: r0=108(x), r1=224(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 224
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
