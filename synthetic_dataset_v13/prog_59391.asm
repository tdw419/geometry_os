; DESCRIPTION: Renders a magenta disk with center (191, 16) and radius 13.
; PLAN: r0=191(x), r1=16(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 16
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
