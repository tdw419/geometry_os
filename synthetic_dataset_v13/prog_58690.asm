; DESCRIPTION: Renders a white disk with center (230, 171) and radius 32.
; PLAN: r0=230(x), r1=171(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 171
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
