; DESCRIPTION: Composite: Sets a single green pixel at (20, 12) then Renders a cyan disk with center (138, 56) and radius 18.
; PLAN: r0=20(x), r1=12(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=138(x), r6=56(y), r7=18(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 20
LDI r1, 12
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 138
LDI r6, 56
LDI r7, 18
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
