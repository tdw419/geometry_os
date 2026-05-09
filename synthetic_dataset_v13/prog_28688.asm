; DESCRIPTION: Renders a magenta disk with center (176, 167) and radius 37.
; PLAN: r0=176(x), r1=167(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 167
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
