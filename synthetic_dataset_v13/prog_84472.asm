; DESCRIPTION: Composite: Places a white dot at position (105, 124) then Places a purple circle of radius 46 at center (461, 119).
; PLAN: r0=105(x), r1=124(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=461(x), r6=119(y), r7=46(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 105
LDI r1, 124
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 461
LDI r6, 119
LDI r7, 46
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
