; DESCRIPTION: Composite: Places a blue dot at position (421, 184) then Renders a white disk with center (283, 134) and radius 67.
; PLAN: r0=421(x), r1=184(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=283(x), r6=134(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 421
LDI r1, 184
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 283
LDI r6, 134
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
