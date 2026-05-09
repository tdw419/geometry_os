; DESCRIPTION: Renders a magenta disk with center (156, 56) and radius 48.
; PLAN: r0=156(x), r1=56(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 56
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
