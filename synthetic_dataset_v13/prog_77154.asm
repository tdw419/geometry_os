; DESCRIPTION: Composite: Places a yellow dot at position (371, 40) then Places a black circle of radius 61 at center (278, 81).
; PLAN: r0=371(x), r1=40(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=81(y), r7=61(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 371
LDI r1, 40
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 278
LDI r6, 81
LDI r7, 61
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
