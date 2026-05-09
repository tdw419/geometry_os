; DESCRIPTION: Composite: Sets a single orange pixel at (129, 29) then Places a white circle of radius 19 at center (104, 163).
; PLAN: r0=129(x), r1=29(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=104(x), r6=163(y), r7=19(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 129
LDI r1, 29
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 104
LDI r6, 163
LDI r7, 19
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
