; DESCRIPTION: Renders a magenta disk with center (72, 113) and radius 44.
; PLAN: r0=72(x), r1=113(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 113
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
