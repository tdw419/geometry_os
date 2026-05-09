; DESCRIPTION: Composite: Creates a cyan circular shape at (228, 125) with radius 63 then Sets a single red pixel at (109, 8).
; PLAN: r0=228(x), r1=125(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=8(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 228
LDI r1, 125
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 8
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
