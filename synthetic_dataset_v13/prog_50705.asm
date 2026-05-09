; DESCRIPTION: Renders a magenta disk with center (29, 46) and radius 28.
; PLAN: r0=29(x), r1=46(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 29
LDI r1, 46
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
