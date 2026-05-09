; DESCRIPTION: Composite: Renders a green disk with center (324, 208) and radius 47 then Places a blue dot at position (29, 126).
; PLAN: r0=324(x), r1=208(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x), r6=126(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 324
LDI r1, 208
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 126
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
