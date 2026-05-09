; DESCRIPTION: Composite: Renders a green disk with center (307, 68) and radius 25 then Sets a single green pixel at (340, 211).
; PLAN: r0=307(x), r1=68(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=340(x), r6=211(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 307
LDI r1, 68
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 340
LDI r6, 211
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
