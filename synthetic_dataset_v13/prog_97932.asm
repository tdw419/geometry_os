; DESCRIPTION: Composite: Places a orange circle of radius 77 at center (396, 175) then Places a red dot at position (129, 143).
; PLAN: r0=396(x), r1=175(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=129(x), r6=143(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 396
LDI r1, 175
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 129
LDI r6, 143
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
