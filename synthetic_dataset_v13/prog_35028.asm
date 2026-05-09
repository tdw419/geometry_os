; DESCRIPTION: Composite: Sets a single cyan pixel at (284, 9) then Creates a orange circular shape at (247, 110) with radius 30.
; PLAN: r0=284(x), r1=9(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=247(x), r6=110(y), r7=30(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 284
LDI r1, 9
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 247
LDI r6, 110
LDI r7, 30
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
