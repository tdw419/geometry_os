; DESCRIPTION: Renders a magenta disk with center (306, 99) and radius 29.
; PLAN: r0=306(x), r1=99(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 99
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
