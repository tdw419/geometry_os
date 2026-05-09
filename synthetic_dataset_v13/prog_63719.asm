; DESCRIPTION: Composite: Creates a green circular shape at (90, 94) with radius 12 then Places a purple dot at position (392, 141).
; PLAN: r0=90(x), r1=94(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=392(x), r6=141(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 90
LDI r1, 94
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 392
LDI r6, 141
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
