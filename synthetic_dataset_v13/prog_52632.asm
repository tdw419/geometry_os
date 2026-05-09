; DESCRIPTION: Composite: Renders a white disk with center (345, 120) and radius 32 then Places a cyan dot at position (467, 63).
; PLAN: r0=345(x), r1=120(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=467(x), r6=63(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 345
LDI r1, 120
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 467
LDI r6, 63
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
