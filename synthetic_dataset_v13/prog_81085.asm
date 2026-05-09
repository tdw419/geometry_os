; DESCRIPTION: Composite: Places a white dot at position (467, 213) then Places a blue circle of radius 72 at center (72, 112).
; PLAN: r0=467(x), r1=213(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=72(x), r6=112(y), r7=72(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 467
LDI r1, 213
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 72
LDI r6, 112
LDI r7, 72
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
