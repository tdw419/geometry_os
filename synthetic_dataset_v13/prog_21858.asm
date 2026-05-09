; DESCRIPTION: Composite: Sets a single orange pixel at (233, 131) then Creates a cyan circular shape at (404, 222) with radius 34.
; PLAN: r0=233(x), r1=131(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=404(x), r6=222(y), r7=34(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 233
LDI r1, 131
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 404
LDI r6, 222
LDI r7, 34
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
