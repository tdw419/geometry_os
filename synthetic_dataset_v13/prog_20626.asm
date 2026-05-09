; DESCRIPTION: Composite: Places a orange circle of radius 15 at center (248, 175) then Places a blue dot at position (425, 32).
; PLAN: r0=248(x), r1=175(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=425(x), r6=32(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 248
LDI r1, 175
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 425
LDI r6, 32
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
