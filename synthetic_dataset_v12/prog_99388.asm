; DESCRIPTION: Renders a magenta disk with center (43, 77) and radius 32.
; PLAN: r0=43(x), r1=77(y), r2=32(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 77
LDI r2, 32
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
