; DESCRIPTION: Renders a magenta disk with center (79, 148) and radius 17.
; PLAN: r0=79(x), r1=148(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 148
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
