; DESCRIPTION: Composite: Sets a single cyan pixel at (47, 205) then Places a orange 110x39 rectangle at position (73, 56).
; PLAN: r0=47(x), r1=205(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=73(x), r6=56(y), r7=110(width), r8=39(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 47
LDI r1, 205
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 73
LDI r6, 56
LDI r7, 110
LDI r8, 39
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
