; DESCRIPTION: Composite: Sets a single magenta pixel at (322, 12) then Places a black circle of radius 76 at center (193, 120).
; PLAN: r0=322(x), r1=12(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=193(x), r6=120(y), r7=76(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 322
LDI r1, 12
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 193
LDI r6, 120
LDI r7, 76
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
