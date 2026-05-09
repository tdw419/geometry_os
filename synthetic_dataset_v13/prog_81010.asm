; DESCRIPTION: Renders a magenta disk with center (192, 25) and radius 10.
; PLAN: r0=192(x), r1=25(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 25
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
