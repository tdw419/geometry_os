; DESCRIPTION: Composite: Sets a single green pixel at (23, 160) then Places a white 108x41 rectangle at position (258, 159).
; PLAN: r0=23(x), r1=160(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=258(x), r6=159(y), r7=108(width), r8=41(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 23
LDI r1, 160
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 258
LDI r6, 159
LDI r7, 108
LDI r8, 41
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
