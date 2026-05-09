; DESCRIPTION: Composite: Sets a single purple pixel at (403, 155) then Draws a cyan circle centered at (388, 47) with radius 31.
; PLAN: r0=403(x), r1=155(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=47(y), r7=31(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 403
LDI r1, 155
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 47
LDI r7, 31
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
