; DESCRIPTION: Renders a magenta disk with center (461, 121) and radius 46.
; PLAN: r0=461(x), r1=121(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 121
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
