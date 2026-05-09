; DESCRIPTION: Composite: Renders a white disk with center (28, 29) and radius 23 then Places a blue dot at position (350, 112).
; PLAN: r0=28(x), r1=29(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=112(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 28
LDI r1, 29
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 112
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
