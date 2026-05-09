; DESCRIPTION: Composite: Places a cyan circle of radius 64 at center (319, 66) then Places a orange dot at position (102, 38).
; PLAN: r0=319(x), r1=66(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x), r6=38(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 66
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 38
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
