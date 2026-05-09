; DESCRIPTION: Renders a magenta disk with center (371, 167) and radius 22.
; PLAN: r0=371(x), r1=167(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 167
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
