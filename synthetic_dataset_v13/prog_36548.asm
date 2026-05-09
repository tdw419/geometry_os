; DESCRIPTION: Composite: Creates a white circular shape at (209, 187) with radius 46 then Sets a single purple pixel at (438, 119).
; PLAN: r0=209(x), r1=187(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=438(x), r6=119(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 209
LDI r1, 187
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 438
LDI r6, 119
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
