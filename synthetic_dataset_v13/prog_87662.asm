; DESCRIPTION: Composite: Creates a cyan circular shape at (144, 196) with radius 57 then Sets a single purple pixel at (393, 118).
; PLAN: r0=144(x), r1=196(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x), r6=118(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 144
LDI r1, 196
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 118
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
