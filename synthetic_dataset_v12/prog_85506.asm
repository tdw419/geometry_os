; DESCRIPTION: Composite: Creates a magenta circular shape at (228, 119) with radius 38 then Sets a single purple pixel at (468, 223).
; PLAN: r0=228(x), r1=119(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=468(x), r6=223(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 228
LDI r1, 119
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 468
LDI r6, 223
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
