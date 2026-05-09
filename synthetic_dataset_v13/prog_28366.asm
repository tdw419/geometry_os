; DESCRIPTION: Composite: Places a cyan circle of radius 47 at center (189, 52) then Places a orange dot at position (428, 108).
; PLAN: r0=189(x), r1=52(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x), r6=108(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 189
LDI r1, 52
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 108
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
