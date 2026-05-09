; DESCRIPTION: Composite: Sets a single white pixel at (365, 95) then Places a black circle of radius 49 at center (344, 152).
; PLAN: r0=365(x), r1=95(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=344(x), r6=152(y), r7=49(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 365
LDI r1, 95
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 344
LDI r6, 152
LDI r7, 49
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
