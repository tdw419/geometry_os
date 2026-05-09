; DESCRIPTION: Renders a magenta disk with center (364, 140) and radius 40.
; PLAN: r0=364(x), r1=140(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 140
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
