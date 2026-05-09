; DESCRIPTION: Composite: Sets a single black pixel at (125, 74) then Creates a white circular shape at (346, 141) with radius 16.
; PLAN: r0=125(x), r1=74(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=346(x), r6=141(y), r7=16(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 125
LDI r1, 74
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 346
LDI r6, 141
LDI r7, 16
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
