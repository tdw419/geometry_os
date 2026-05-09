; DESCRIPTION: Composite: Sets a single cyan pixel at (177, 14) then Places a orange 55x65 rectangle at position (309, 92).
; PLAN: r0=177(x), r1=14(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=92(y), r7=55(width), r8=65(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 177
LDI r1, 14
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 309
LDI r6, 92
LDI r7, 55
LDI r8, 65
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
