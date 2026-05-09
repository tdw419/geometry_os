; DESCRIPTION: Composite: Creates a black circular shape at (94, 97) with radius 70 then Places a magenta dot at position (3, 94).
; PLAN: r0=94(x), r1=97(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x), r6=94(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 94
LDI r1, 97
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 94
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
