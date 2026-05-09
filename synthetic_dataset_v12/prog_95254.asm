; DESCRIPTION: Composite: Places a orange circle of radius 32 at center (333, 179) then Places a purple dot at position (498, 230).
; PLAN: r0=333(x), r1=179(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=498(x), r6=230(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 333
LDI r1, 179
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 498
LDI r6, 230
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
