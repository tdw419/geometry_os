; DESCRIPTION: Renders a magenta disk with center (84, 73) and radius 55.
; PLAN: r0=84(x), r1=73(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 73
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
