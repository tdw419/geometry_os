; DESCRIPTION: Renders a magenta disk with center (346, 148) and radius 48.
; PLAN: r0=346(x), r1=148(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 148
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
