; DESCRIPTION: Renders a black disk with center (360, 166) and radius 20.
; PLAN: r0=360(x), r1=166(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 166
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
