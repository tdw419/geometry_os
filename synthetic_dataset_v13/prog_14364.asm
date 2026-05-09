; DESCRIPTION: Composite: Sets a single green pixel at (508, 54) then Places a green 60x18 rectangle at position (117, 231).
; PLAN: r0=508(x), r1=54(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=117(x), r6=231(y), r7=60(width), r8=18(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 508
LDI r1, 54
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 117
LDI r6, 231
LDI r7, 60
LDI r8, 18
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
