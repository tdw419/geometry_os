; DESCRIPTION: Renders a black disk with center (87, 148) and radius 70.
; PLAN: r0=87(x), r1=148(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 148
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
