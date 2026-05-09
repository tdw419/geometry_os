; DESCRIPTION: Composite: Renders a blue disk with center (417, 142) and radius 59 then Places a green dot at position (184, 157).
; PLAN: r0=417(x), r1=142(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=157(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 417
LDI r1, 142
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 157
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
