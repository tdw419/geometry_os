; DESCRIPTION: Composite: Places a blue circle of radius 57 at center (430, 145) then Places a black dot at position (75, 14).
; PLAN: r0=430(x), r1=145(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x), r6=14(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 430
LDI r1, 145
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 14
LDI r7, 0x000000
PSET r5, r6, r7
HALT
