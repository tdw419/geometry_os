; DESCRIPTION: Composite: Sets a single cyan pixel at (222, 5) then Creates a red circular shape at (393, 112) with radius 76.
; PLAN: r0=222(x), r1=5(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=393(x), r6=112(y), r7=76(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 222
LDI r1, 5
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 393
LDI r6, 112
LDI r7, 76
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
