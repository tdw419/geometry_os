; DESCRIPTION: Renders a magenta disk with center (178, 126) and radius 76.
; PLAN: r0=178(x), r1=126(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 126
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
