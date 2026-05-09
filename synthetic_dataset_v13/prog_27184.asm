; DESCRIPTION: Renders a magenta disk with center (380, 163) and radius 29.
; PLAN: r0=380(x), r1=163(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 163
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
