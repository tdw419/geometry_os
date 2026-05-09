; DESCRIPTION: Composite: Creates a yellow circular shape at (425, 141) with radius 23 then Places a white dot at position (386, 80).
; PLAN: r0=425(x), r1=141(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=386(x), r6=80(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 425
LDI r1, 141
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 386
LDI r6, 80
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
