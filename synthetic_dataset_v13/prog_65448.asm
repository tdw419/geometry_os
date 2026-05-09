; DESCRIPTION: Renders a magenta disk with center (121, 188) and radius 44.
; PLAN: r0=121(x), r1=188(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 188
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
