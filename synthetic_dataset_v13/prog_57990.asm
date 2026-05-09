; DESCRIPTION: Composite: Sets a single orange pixel at (99, 42) then Places a green circle of radius 17 at center (116, 128).
; PLAN: r0=99(x), r1=42(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=116(x), r6=128(y), r7=17(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 99
LDI r1, 42
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 116
LDI r6, 128
LDI r7, 17
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
