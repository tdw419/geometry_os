; DESCRIPTION: Renders a magenta disk with center (241, 149) and radius 69.
; PLAN: r0=241(x), r1=149(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 149
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
