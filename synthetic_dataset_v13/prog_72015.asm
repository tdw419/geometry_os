; DESCRIPTION: Composite: Sets a single black pixel at (294, 129) then Renders a white disk with center (155, 137) and radius 72.
; PLAN: r0=294(x), r1=129(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=155(x), r6=137(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 294
LDI r1, 129
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 155
LDI r6, 137
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
