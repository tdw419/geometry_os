; DESCRIPTION: Composite: Renders a cyan disk with center (237, 93) and radius 26 then Places a white dot at position (8, 239).
; PLAN: r0=237(x), r1=93(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=8(x), r6=239(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 237
LDI r1, 93
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 8
LDI r6, 239
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
