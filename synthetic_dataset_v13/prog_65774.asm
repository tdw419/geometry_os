; DESCRIPTION: Composite: Sets a single green pixel at (368, 82) then Places a orange 24x114 rectangle at position (43, 64).
; PLAN: r0=368(x), r1=82(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=43(x), r6=64(y), r7=24(width), r8=114(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 82
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 43
LDI r6, 64
LDI r7, 24
LDI r8, 114
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
