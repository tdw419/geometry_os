; DESCRIPTION: Renders a magenta disk with center (460, 188) and radius 34.
; PLAN: r0=460(x), r1=188(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 460
LDI r1, 188
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
