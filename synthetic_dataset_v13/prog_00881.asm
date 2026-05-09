; DESCRIPTION: Composite: Creates a green circular shape at (442, 138) with radius 52 then Sets a single purple pixel at (435, 220).
; PLAN: r0=442(x), r1=138(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=220(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 442
LDI r1, 138
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 220
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
