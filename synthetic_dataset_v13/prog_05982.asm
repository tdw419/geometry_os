; DESCRIPTION: Composite: Places a green circle of radius 52 at center (203, 157) then Sets a single purple pixel at (340, 4).
; PLAN: r0=203(x), r1=157(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=340(x), r6=4(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 203
LDI r1, 157
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 340
LDI r6, 4
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
