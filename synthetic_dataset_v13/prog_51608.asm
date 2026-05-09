; DESCRIPTION: Renders a magenta disk with center (231, 62) and radius 35.
; PLAN: r0=231(x), r1=62(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 62
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
