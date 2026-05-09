; DESCRIPTION: Composite: Sets a single orange pixel at (487, 119) then Places a cyan 29x109 rectangle at position (139, 13).
; PLAN: r0=487(x), r1=119(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=139(x), r6=13(y), r7=29(width), r8=109(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 487
LDI r1, 119
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 139
LDI r6, 13
LDI r7, 29
LDI r8, 109
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
