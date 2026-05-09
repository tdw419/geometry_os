; DESCRIPTION: Composite: Renders a white disk with center (67, 171) and radius 43 then Places a green dot at position (42, 51).
; PLAN: r0=67(x), r1=171(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x), r6=51(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 67
LDI r1, 171
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 51
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
