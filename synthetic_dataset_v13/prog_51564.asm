; DESCRIPTION: Composite: Sets a single green pixel at (83, 226) then Renders a cyan box of size 32x10 starting at (207, 190).
; PLAN: r0=83(x), r1=226(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=190(y), r7=32(width), r8=10(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 83
LDI r1, 226
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 207
LDI r6, 190
LDI r7, 32
LDI r8, 10
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
