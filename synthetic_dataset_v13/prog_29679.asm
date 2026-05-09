; DESCRIPTION: Composite: Sets a single black pixel at (226, 16) then Places a blue circle of radius 31 at center (118, 195).
; PLAN: r0=226(x), r1=16(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=195(y), r7=31(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 226
LDI r1, 16
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 118
LDI r6, 195
LDI r7, 31
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
