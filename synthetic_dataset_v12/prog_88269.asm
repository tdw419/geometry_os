; DESCRIPTION: Composite: Sets a single cyan pixel at (40, 190) then Creates a magenta circular shape at (174, 55) with radius 49.
; PLAN: r0=40(x), r1=190(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=174(x), r6=55(y), r7=49(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 40
LDI r1, 190
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 174
LDI r6, 55
LDI r7, 49
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
