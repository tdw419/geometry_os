; DESCRIPTION: Composite: Sets a single green pixel at (358, 32) then Renders a cyan box of size 26x104 starting at (247, 22).
; PLAN: r0=358(x), r1=32(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=247(x), r6=22(y), r7=26(width), r8=104(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 32
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 247
LDI r6, 22
LDI r7, 26
LDI r8, 104
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
