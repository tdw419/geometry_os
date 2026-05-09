; DESCRIPTION: Composite: Creates a white circular shape at (326, 97) with radius 52 then Sets a single yellow pixel at (32, 86).
; PLAN: r0=326(x), r1=97(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x), r6=86(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 326
LDI r1, 97
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 86
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
