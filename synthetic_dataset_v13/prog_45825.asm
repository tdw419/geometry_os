; DESCRIPTION: Composite: Places a orange circle of radius 76 at center (316, 149) then Places a cyan dot at position (510, 41).
; PLAN: r0=316(x), r1=149(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=510(x), r6=41(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 316
LDI r1, 149
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 510
LDI r6, 41
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
