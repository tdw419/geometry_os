; DESCRIPTION: Renders a magenta disk with center (402, 65) and radius 63.
; PLAN: r0=402(x), r1=65(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 65
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
