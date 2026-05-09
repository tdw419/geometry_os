; DESCRIPTION: Composite: Sets a single orange pixel at (346, 128) then Places a cyan circle of radius 47 at center (382, 179).
; PLAN: r0=346(x), r1=128(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=382(x), r6=179(y), r7=47(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 346
LDI r1, 128
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 382
LDI r6, 179
LDI r7, 47
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
