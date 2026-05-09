; DESCRIPTION: Renders a magenta disk with center (102, 141) and radius 63.
; PLAN: r0=102(x), r1=141(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 141
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
