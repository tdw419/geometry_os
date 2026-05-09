; DESCRIPTION: Composite: Places a cyan circle of radius 64 at center (376, 99) then Places a green dot at position (181, 183).
; PLAN: r0=376(x), r1=99(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x), r6=183(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 376
LDI r1, 99
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 183
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
