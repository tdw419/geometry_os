; DESCRIPTION: Composite: Places a green circle of radius 42 at center (260, 190) then Places a blue dot at position (129, 224).
; PLAN: r0=260(x), r1=190(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=129(x), r6=224(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 260
LDI r1, 190
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 129
LDI r6, 224
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
