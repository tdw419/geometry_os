; DESCRIPTION: Composite: Sets a single cyan pixel at (273, 45) then Renders a green disk with center (349, 50) and radius 11.
; PLAN: r0=273(x), r1=45(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=349(x), r6=50(y), r7=11(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 273
LDI r1, 45
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 349
LDI r6, 50
LDI r7, 11
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
