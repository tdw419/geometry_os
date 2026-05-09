; DESCRIPTION: Renders a magenta disk with center (481, 208) and radius 12.
; PLAN: r0=481(x), r1=208(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 481
LDI r1, 208
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
