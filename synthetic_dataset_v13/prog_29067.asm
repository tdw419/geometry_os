; DESCRIPTION: Composite: Sets a single magenta pixel at (3, 197) then Creates a cyan circular shape at (103, 142) with radius 45.
; PLAN: r0=3(x), r1=197(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=103(x), r6=142(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 3
LDI r1, 197
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 103
LDI r6, 142
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
