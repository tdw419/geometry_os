; DESCRIPTION: Composite: Sets a single cyan pixel at (481, 112) then Places a yellow circle of radius 23 at center (404, 192).
; PLAN: r0=481(x), r1=112(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=404(x), r6=192(y), r7=23(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 481
LDI r1, 112
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 404
LDI r6, 192
LDI r7, 23
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
