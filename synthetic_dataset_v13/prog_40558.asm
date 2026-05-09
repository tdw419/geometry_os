; DESCRIPTION: Composite: Places a green circle of radius 62 at center (136, 82) then Places a white dot at position (274, 173).
; PLAN: r0=136(x), r1=82(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x), r6=173(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 136
LDI r1, 82
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 173
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
