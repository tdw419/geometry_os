; DESCRIPTION: Renders a magenta disk with center (320, 136) and radius 46.
; PLAN: r0=320(x), r1=136(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 136
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
