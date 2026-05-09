; DESCRIPTION: Composite: Places a white circle of radius 41 at center (319, 91) then Places a white dot at position (214, 214).
; PLAN: r0=319(x), r1=91(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x), r6=214(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 91
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 214
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
