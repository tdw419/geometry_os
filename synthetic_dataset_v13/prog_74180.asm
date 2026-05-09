; DESCRIPTION: Renders a white disk with center (132, 99) and radius 53.
; PLAN: r0=132(x), r1=99(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 99
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
