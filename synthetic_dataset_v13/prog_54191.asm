; DESCRIPTION: Renders a magenta disk with center (239, 185) and radius 19.
; PLAN: r0=239(x), r1=185(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 185
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
