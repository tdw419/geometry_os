; DESCRIPTION: Renders a magenta disk with center (98, 121) and radius 60.
; PLAN: r0=98(x), r1=121(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 121
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
