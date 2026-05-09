; DESCRIPTION: Composite: Places a white dot at position (508, 251) then Places a cyan 36x117 rectangle at position (82, 133).
; PLAN: r0=508(x), r1=251(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=82(x), r6=133(y), r7=36(width), r8=117(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 508
LDI r1, 251
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 82
LDI r6, 133
LDI r7, 36
LDI r8, 117
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
