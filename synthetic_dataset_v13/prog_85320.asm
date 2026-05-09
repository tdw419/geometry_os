; DESCRIPTION: Composite: Sets a single yellow pixel at (286, 248) then Places a white 47x73 rectangle at position (215, 139).
; PLAN: r0=286(x), r1=248(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=215(x), r6=139(y), r7=47(width), r8=73(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 286
LDI r1, 248
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 215
LDI r6, 139
LDI r7, 47
LDI r8, 73
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
