; DESCRIPTION: Renders a magenta disk with center (324, 126) and radius 63.
; PLAN: r0=324(x), r1=126(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 126
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
