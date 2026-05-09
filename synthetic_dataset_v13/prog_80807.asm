; DESCRIPTION: Renders a magenta disk with center (293, 175) and radius 45.
; PLAN: r0=293(x), r1=175(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 175
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
