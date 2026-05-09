; DESCRIPTION: Composite: Renders a white disk with center (339, 76) and radius 42 then Sets a single cyan pixel at (296, 114).
; PLAN: r0=339(x), r1=76(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=296(x), r6=114(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 339
LDI r1, 76
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 296
LDI r6, 114
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
