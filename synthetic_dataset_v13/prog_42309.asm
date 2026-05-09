; DESCRIPTION: Composite: Sets a single black pixel at (62, 39) then Places a cyan 108x65 rectangle at position (64, 41).
; PLAN: r0=62(x), r1=39(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=64(x), r6=41(y), r7=108(width), r8=65(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 39
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 64
LDI r6, 41
LDI r7, 108
LDI r8, 65
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
