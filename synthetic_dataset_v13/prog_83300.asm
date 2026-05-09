; DESCRIPTION: Composite: Creates a black circular shape at (271, 142) with radius 50 then Sets a single purple pixel at (360, 99).
; PLAN: r0=271(x), r1=142(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x), r6=99(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 271
LDI r1, 142
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 99
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
