; DESCRIPTION: Composite: Places a white dot at position (28, 15) then Places a white circle of radius 45 at center (424, 172).
; PLAN: r0=28(x), r1=15(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=424(x), r6=172(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 28
LDI r1, 15
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 424
LDI r6, 172
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
