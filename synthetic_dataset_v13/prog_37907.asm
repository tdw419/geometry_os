; DESCRIPTION: Composite: Sets a single green pixel at (71, 190) then Creates a magenta circular shape at (373, 146) with radius 77.
; PLAN: r0=71(x), r1=190(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=373(x), r6=146(y), r7=77(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 71
LDI r1, 190
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 373
LDI r6, 146
LDI r7, 77
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
