; DESCRIPTION: Composite: Places a white circle of radius 23 at center (467, 88) then Places a red dot at position (97, 175).
; PLAN: r0=467(x), r1=88(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x), r6=175(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 467
LDI r1, 88
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 175
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
