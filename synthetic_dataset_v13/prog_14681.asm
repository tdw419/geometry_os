; DESCRIPTION: Composite: Sets a single white pixel at (344, 1) then Places a cyan circle of radius 49 at center (238, 189).
; PLAN: r0=344(x), r1=1(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=238(x), r6=189(y), r7=49(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 344
LDI r1, 1
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 238
LDI r6, 189
LDI r7, 49
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
