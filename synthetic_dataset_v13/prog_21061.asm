; DESCRIPTION: Renders a magenta disk with center (61, 182) and radius 17.
; PLAN: r0=61(x), r1=182(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 182
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
