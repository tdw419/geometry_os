; DESCRIPTION: Composite: Sets a single black pixel at (120, 143) then Places a white circle of radius 64 at center (154, 66).
; PLAN: r0=120(x), r1=143(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=154(x), r6=66(y), r7=64(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 120
LDI r1, 143
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 154
LDI r6, 66
LDI r7, 64
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
