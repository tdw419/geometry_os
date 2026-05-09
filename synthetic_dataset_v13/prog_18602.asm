; DESCRIPTION: Composite: Places a green circle of radius 56 at center (192, 176) then Places a blue dot at position (439, 72).
; PLAN: r0=192(x), r1=176(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x), r6=72(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 192
LDI r1, 176
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 72
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
