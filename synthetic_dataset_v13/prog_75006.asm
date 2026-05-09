; DESCRIPTION: Renders a blue disk with center (103, 140) and radius 46.
; PLAN: r0=103(x), r1=140(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 140
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
