; DESCRIPTION: Renders a white disk with center (279, 142) and radius 70.
; PLAN: r0=279(x), r1=142(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 142
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
