; DESCRIPTION: Composite: Renders a green disk with center (199, 136) and radius 62 then Places a orange dot at position (33, 25).
; PLAN: r0=199(x), r1=136(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x), r6=25(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 199
LDI r1, 136
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 25
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
