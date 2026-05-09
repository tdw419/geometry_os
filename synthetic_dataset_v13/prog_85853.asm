; DESCRIPTION: Renders a magenta disk with center (447, 195) and radius 17.
; PLAN: r0=447(x), r1=195(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 195
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
