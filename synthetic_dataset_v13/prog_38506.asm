; DESCRIPTION: Composite: Sets a single cyan pixel at (436, 75) then Places a cyan circle of radius 32 at center (446, 163).
; PLAN: r0=436(x), r1=75(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=446(x), r6=163(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 436
LDI r1, 75
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 446
LDI r6, 163
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
