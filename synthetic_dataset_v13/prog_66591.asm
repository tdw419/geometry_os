; DESCRIPTION: Composite: Places a magenta dot at position (341, 249) then Places a cyan circle of radius 33 at center (299, 211).
; PLAN: r0=341(x), r1=249(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=211(y), r7=33(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 249
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 299
LDI r6, 211
LDI r7, 33
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
