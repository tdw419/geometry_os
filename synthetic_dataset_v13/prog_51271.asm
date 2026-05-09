; DESCRIPTION: Composite: Sets a single yellow pixel at (285, 73) then Renders a cyan disk with center (418, 115) and radius 68.
; PLAN: r0=285(x), r1=73(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=418(x), r6=115(y), r7=68(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 285
LDI r1, 73
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 418
LDI r6, 115
LDI r7, 68
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
