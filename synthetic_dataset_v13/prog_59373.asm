; DESCRIPTION: Composite: Renders a orange disk with center (314, 154) and radius 21 then Sets a single green pixel at (480, 186).
; PLAN: r0=314(x), r1=154(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=480(x), r6=186(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 314
LDI r1, 154
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 480
LDI r6, 186
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
