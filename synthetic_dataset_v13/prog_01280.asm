; DESCRIPTION: Composite: Places a white dot at position (47, 5) then Places a blue circle of radius 68 at center (139, 125).
; PLAN: r0=47(x), r1=5(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=139(x), r6=125(y), r7=68(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 47
LDI r1, 5
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 125
LDI r7, 68
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
