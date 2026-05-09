; DESCRIPTION: Renders a magenta disk with center (389, 82) and radius 14.
; PLAN: r0=389(x), r1=82(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 82
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
