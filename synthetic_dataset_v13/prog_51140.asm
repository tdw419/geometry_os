; DESCRIPTION: Composite: Places a black circle of radius 52 at center (321, 103) then Places a orange dot at position (192, 13).
; PLAN: r0=321(x), r1=103(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=13(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 321
LDI r1, 103
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 13
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
