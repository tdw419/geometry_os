; DESCRIPTION: Composite: Sets a single green pixel at (351, 189) then Places a purple 76x110 rectangle at position (409, 50).
; PLAN: r0=351(x), r1=189(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=409(x), r6=50(y), r7=76(width), r8=110(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 189
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 409
LDI r6, 50
LDI r7, 76
LDI r8, 110
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
