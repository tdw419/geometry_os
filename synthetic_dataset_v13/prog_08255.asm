; DESCRIPTION: Composite: Sets a single cyan pixel at (393, 161) then Creates a orange circular shape at (77, 90) with radius 50.
; PLAN: r0=393(x), r1=161(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=77(x), r6=90(y), r7=50(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 393
LDI r1, 161
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 77
LDI r6, 90
LDI r7, 50
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
