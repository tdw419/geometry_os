; DESCRIPTION: Renders a magenta disk with center (314, 168) and radius 76.
; PLAN: r0=314(x), r1=168(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 168
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
