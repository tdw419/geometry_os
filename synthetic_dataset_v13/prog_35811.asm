; DESCRIPTION: Renders a magenta disk with center (245, 120) and radius 17.
; PLAN: r0=245(x), r1=120(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 120
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
