; DESCRIPTION: Composite: Sets a single orange pixel at (169, 182) then Places a cyan circle of radius 39 at center (81, 126).
; PLAN: r0=169(x), r1=182(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=126(y), r7=39(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 169
LDI r1, 182
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 81
LDI r6, 126
LDI r7, 39
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
