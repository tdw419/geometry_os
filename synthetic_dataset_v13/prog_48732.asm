; DESCRIPTION: Composite: Sets a single red pixel at (90, 80) then Places a cyan circle of radius 52 at center (207, 118).
; PLAN: r0=90(x), r1=80(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=118(y), r7=52(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 90
LDI r1, 80
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 207
LDI r6, 118
LDI r7, 52
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
