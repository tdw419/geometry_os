; DESCRIPTION: Renders a magenta disk with center (224, 107) and radius 10.
; PLAN: r0=224(x), r1=107(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 107
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
