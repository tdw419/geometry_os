; DESCRIPTION: Composite: Places a cyan circle of radius 50 at center (271, 201) then Places a orange dot at position (336, 192).
; PLAN: r0=271(x), r1=201(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=336(x), r6=192(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 271
LDI r1, 201
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 336
LDI r6, 192
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
