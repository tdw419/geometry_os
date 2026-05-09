; DESCRIPTION: Composite: Sets a single cyan pixel at (492, 249) then Renders a green disk with center (388, 81) and radius 36.
; PLAN: r0=492(x), r1=249(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=81(y), r7=36(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 492
LDI r1, 249
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 81
LDI r7, 36
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
