; DESCRIPTION: Renders a magenta disk with center (224, 198) and radius 17.
; PLAN: r0=224(x), r1=198(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 198
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
