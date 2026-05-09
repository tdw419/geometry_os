; DESCRIPTION: Composite: Sets a single magenta pixel at (205, 44) then Places a purple circle of radius 38 at center (336, 139).
; PLAN: r0=205(x), r1=44(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=336(x), r6=139(y), r7=38(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 205
LDI r1, 44
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 336
LDI r6, 139
LDI r7, 38
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
