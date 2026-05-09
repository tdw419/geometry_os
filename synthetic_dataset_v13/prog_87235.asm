; DESCRIPTION: Composite: Places a white circle of radius 12 at center (426, 38) then Places a orange dot at position (333, 170).
; PLAN: r0=426(x), r1=38(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=333(x), r6=170(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 426
LDI r1, 38
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 333
LDI r6, 170
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
