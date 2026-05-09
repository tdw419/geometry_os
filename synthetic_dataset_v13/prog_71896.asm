; DESCRIPTION: Composite: Creates a cyan circular shape at (105, 104) with radius 41 then Sets a single orange pixel at (243, 30).
; PLAN: r0=105(x), r1=104(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=243(x), r6=30(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 105
LDI r1, 104
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 243
LDI r6, 30
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
