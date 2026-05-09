; DESCRIPTION: Composite: Sets a single black pixel at (145, 103) then Places a white circle of radius 26 at center (141, 174).
; PLAN: r0=145(x), r1=103(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=141(x), r6=174(y), r7=26(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 145
LDI r1, 103
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 141
LDI r6, 174
LDI r7, 26
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
