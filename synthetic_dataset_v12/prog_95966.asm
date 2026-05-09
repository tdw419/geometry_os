; DESCRIPTION: Renders a magenta disk with center (160, 243) and radius 13.
; PLAN: r0=160(x), r1=243(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 243
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
