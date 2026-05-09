; DESCRIPTION: Composite: Sets a single cyan pixel at (242, 36) then Creates a magenta circular shape at (58, 123) with radius 55.
; PLAN: r0=242(x), r1=36(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=58(x), r6=123(y), r7=55(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 242
LDI r1, 36
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 58
LDI r6, 123
LDI r7, 55
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
