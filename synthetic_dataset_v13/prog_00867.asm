; DESCRIPTION: Composite: Sets a single yellow pixel at (141, 124) then Places a cyan 38x35 rectangle at position (281, 56).
; PLAN: r0=141(x), r1=124(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=281(x), r6=56(y), r7=38(width), r8=35(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 124
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 281
LDI r6, 56
LDI r7, 38
LDI r8, 35
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
