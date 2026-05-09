; DESCRIPTION: Renders a magenta disk with center (365, 139) and radius 63.
; PLAN: r0=365(x), r1=139(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 139
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
