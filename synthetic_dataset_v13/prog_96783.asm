; DESCRIPTION: Composite: Places a blue circle of radius 28 at center (439, 211) then Places a yellow dot at position (271, 203).
; PLAN: r0=439(x), r1=211(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=271(x), r6=203(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 439
LDI r1, 211
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 271
LDI r6, 203
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
