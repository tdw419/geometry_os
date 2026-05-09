; DESCRIPTION: Composite: Sets a single red pixel at (5, 60) then Renders a green disk with center (36, 234) and radius 18.
; PLAN: r0=5(x), r1=60(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=36(x), r6=234(y), r7=18(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 5
LDI r1, 60
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 36
LDI r6, 234
LDI r7, 18
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
