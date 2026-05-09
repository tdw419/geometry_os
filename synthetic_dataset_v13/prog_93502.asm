; DESCRIPTION: Composite: Sets a single orange pixel at (501, 103) then Places a cyan circle of radius 51 at center (136, 126).
; PLAN: r0=501(x), r1=103(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=136(x), r6=126(y), r7=51(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 501
LDI r1, 103
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 136
LDI r6, 126
LDI r7, 51
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
