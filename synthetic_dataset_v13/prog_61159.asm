; DESCRIPTION: Composite: Places a blue dot at position (327, 48) then Renders a cyan disk with center (391, 234) and radius 17.
; PLAN: r0=327(x), r1=48(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=391(x), r6=234(y), r7=17(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 327
LDI r1, 48
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 391
LDI r6, 234
LDI r7, 17
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
