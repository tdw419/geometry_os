; DESCRIPTION: Composite: Places a red circle of radius 33 at center (424, 45) then Places a cyan dot at position (49, 126).
; PLAN: r0=424(x), r1=45(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=126(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 424
LDI r1, 45
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 126
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
