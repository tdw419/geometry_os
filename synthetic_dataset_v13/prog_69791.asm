; DESCRIPTION: Composite: Renders a cyan disk with center (104, 183) and radius 13 then Places a magenta dot at position (150, 216).
; PLAN: r0=104(x), r1=183(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x), r6=216(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 104
LDI r1, 183
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 216
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
