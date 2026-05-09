; DESCRIPTION: Composite: Places a white dot at position (83, 174) then Places a cyan circle of radius 29 at center (307, 90).
; PLAN: r0=83(x), r1=174(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=307(x), r6=90(y), r7=29(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 83
LDI r1, 174
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 307
LDI r6, 90
LDI r7, 29
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
