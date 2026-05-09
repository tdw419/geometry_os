; DESCRIPTION: Composite: Sets a single orange pixel at (471, 65) then Renders a green box of size 21x66 starting at (257, 23).
; PLAN: r0=471(x), r1=65(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=257(x), r6=23(y), r7=21(width), r8=66(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 471
LDI r1, 65
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 257
LDI r6, 23
LDI r7, 21
LDI r8, 66
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
