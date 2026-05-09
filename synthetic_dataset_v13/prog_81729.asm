; DESCRIPTION: Composite: Sets a single cyan pixel at (203, 207) then Renders a green disk with center (335, 62) and radius 43.
; PLAN: r0=203(x), r1=207(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=335(x), r6=62(y), r7=43(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 203
LDI r1, 207
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 335
LDI r6, 62
LDI r7, 43
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
