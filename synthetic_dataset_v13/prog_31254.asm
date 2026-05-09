; DESCRIPTION: Composite: Places a yellow dot at position (98, 229) then Renders a green disk with center (299, 20) and radius 11.
; PLAN: r0=98(x), r1=229(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=20(y), r7=11(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 98
LDI r1, 229
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 299
LDI r6, 20
LDI r7, 11
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
