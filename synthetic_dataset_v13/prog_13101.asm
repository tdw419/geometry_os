; DESCRIPTION: Composite: Places a blue dot at position (394, 148) then Places a black circle of radius 47 at center (177, 131).
; PLAN: r0=394(x), r1=148(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=177(x), r6=131(y), r7=47(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 394
LDI r1, 148
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 177
LDI r6, 131
LDI r7, 47
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
