; DESCRIPTION: Composite: Places a orange circle of radius 78 at center (239, 97) then Places a cyan dot at position (250, 107).
; PLAN: r0=239(x), r1=97(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x), r6=107(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 239
LDI r1, 97
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 107
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
