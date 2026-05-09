; DESCRIPTION: Composite: Sets a single green pixel at (196, 20) then Draws a cyan circle centered at (172, 86) with radius 78.
; PLAN: r0=196(x), r1=20(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=172(x), r6=86(y), r7=78(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 196
LDI r1, 20
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 172
LDI r6, 86
LDI r7, 78
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
