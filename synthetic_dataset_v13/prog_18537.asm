; DESCRIPTION: Composite: Sets a single red pixel at (25, 149) then Creates a blue circular shape at (167, 50) with radius 27.
; PLAN: r0=25(x), r1=149(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=167(x), r6=50(y), r7=27(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 25
LDI r1, 149
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 167
LDI r6, 50
LDI r7, 27
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
