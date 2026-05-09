; DESCRIPTION: Composite: Places a blue dot at position (477, 16) then Places a black circle of radius 12 at center (301, 33).
; PLAN: r0=477(x), r1=16(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=301(x), r6=33(y), r7=12(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 477
LDI r1, 16
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 301
LDI r6, 33
LDI r7, 12
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
