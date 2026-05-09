; DESCRIPTION: Renders a magenta disk with center (224, 138) and radius 79.
; PLAN: r0=224(x), r1=138(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 138
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
