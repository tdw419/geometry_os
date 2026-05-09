; DESCRIPTION: Renders a magenta disk with center (446, 69) and radius 55.
; PLAN: r0=446(x), r1=69(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 69
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
