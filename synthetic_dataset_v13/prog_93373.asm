; DESCRIPTION: Renders a magenta disk with center (469, 79) and radius 24.
; PLAN: r0=469(x), r1=79(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 79
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
