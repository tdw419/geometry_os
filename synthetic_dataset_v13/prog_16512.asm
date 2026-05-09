; DESCRIPTION: Renders a magenta disk with center (443, 144) and radius 69.
; PLAN: r0=443(x), r1=144(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 144
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
