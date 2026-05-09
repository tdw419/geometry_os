; DESCRIPTION: Composite: Sets a single red pixel at (450, 178) then Draws a cyan circle centered at (187, 89) with radius 52.
; PLAN: r0=450(x), r1=178(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=187(x), r6=89(y), r7=52(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 450
LDI r1, 178
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 187
LDI r6, 89
LDI r7, 52
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
