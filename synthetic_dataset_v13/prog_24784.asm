; DESCRIPTION: Renders a magenta disk with center (443, 72) and radius 26.
; PLAN: r0=443(x), r1=72(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 72
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
