; DESCRIPTION: Renders a magenta disk with center (296, 96) and radius 23.
; PLAN: r0=296(x), r1=96(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 96
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
