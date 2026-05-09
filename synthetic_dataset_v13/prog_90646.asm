; DESCRIPTION: Composite: Places a orange dot at position (319, 37) then Renders a cyan disk with center (67, 147) and radius 21.
; PLAN: r0=319(x), r1=37(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=147(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 319
LDI r1, 37
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 67
LDI r6, 147
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
