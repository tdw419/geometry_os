; DESCRIPTION: Composite: Creates a red circular shape at (279, 146) with radius 42 then Sets a single purple pixel at (413, 251).
; PLAN: r0=279(x), r1=146(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=413(x), r6=251(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 279
LDI r1, 146
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 413
LDI r6, 251
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
