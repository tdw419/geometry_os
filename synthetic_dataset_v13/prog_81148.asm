; DESCRIPTION: Composite: Places a cyan dot at position (364, 95) then Renders a orange disk with center (89, 206) and radius 23.
; PLAN: r0=364(x), r1=95(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=89(x), r6=206(y), r7=23(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 364
LDI r1, 95
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 89
LDI r6, 206
LDI r7, 23
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
