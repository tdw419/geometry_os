; DESCRIPTION: Composite: Places a black circle of radius 80 at center (86, 139) then Places a orange dot at position (179, 110).
; PLAN: r0=86(x), r1=139(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x), r6=110(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 86
LDI r1, 139
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 110
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
