; DESCRIPTION: Renders a magenta disk with center (203, 86) and radius 28.
; PLAN: r0=203(x), r1=86(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 86
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
