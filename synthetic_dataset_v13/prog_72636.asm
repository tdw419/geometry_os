; DESCRIPTION: Composite: Renders a white disk with center (394, 161) and radius 76 then Places a blue dot at position (92, 135).
; PLAN: r0=394(x), r1=161(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=92(x), r6=135(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 394
LDI r1, 161
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 92
LDI r6, 135
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
