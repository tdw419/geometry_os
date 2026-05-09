; DESCRIPTION: Renders a magenta disk with center (187, 101) and radius 53.
; PLAN: r0=187(x), r1=101(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 101
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
