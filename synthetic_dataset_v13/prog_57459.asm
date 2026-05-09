; DESCRIPTION: Composite: Places a yellow circle of radius 32 at center (390, 55) then Places a cyan dot at position (394, 31).
; PLAN: r0=390(x), r1=55(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=394(x), r6=31(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 390
LDI r1, 55
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 394
LDI r6, 31
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
