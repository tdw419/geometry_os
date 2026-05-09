; DESCRIPTION: Renders a red disk with center (291, 140) and radius 29.
; PLAN: r0=291(x), r1=140(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 140
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
