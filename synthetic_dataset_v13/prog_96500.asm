; DESCRIPTION: Renders a magenta disk with center (452, 108) and radius 47.
; PLAN: r0=452(x), r1=108(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 108
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
