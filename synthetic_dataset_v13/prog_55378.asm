; DESCRIPTION: Composite: Renders a cyan disk with center (372, 164) and radius 78 then Sets a single blue pixel at (392, 101).
; PLAN: r0=372(x), r1=164(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=392(x), r6=101(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 372
LDI r1, 164
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 392
LDI r6, 101
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
