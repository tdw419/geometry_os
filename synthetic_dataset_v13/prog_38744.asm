; DESCRIPTION: Renders a magenta disk with center (375, 152) and radius 63.
; PLAN: r0=375(x), r1=152(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 152
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
