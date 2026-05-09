; DESCRIPTION: Composite: Renders a green disk with center (128, 175) and radius 26 then Places a blue dot at position (206, 160).
; PLAN: r0=128(x), r1=175(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x), r6=160(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 128
LDI r1, 175
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 160
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
