; DESCRIPTION: Renders a magenta disk with center (443, 162) and radius 60.
; PLAN: r0=443(x), r1=162(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 162
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
