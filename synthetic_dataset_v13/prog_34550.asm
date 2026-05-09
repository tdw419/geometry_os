; DESCRIPTION: Renders a magenta disk with center (156, 103) and radius 11.
; PLAN: r0=156(x), r1=103(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 103
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
