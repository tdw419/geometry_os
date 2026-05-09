; DESCRIPTION: Renders a magenta disk with center (173, 114) and radius 64.
; PLAN: r0=173(x), r1=114(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 114
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
