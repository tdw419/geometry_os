; DESCRIPTION: Composite: Places a cyan dot at position (141, 252) then Places a black 92x95 rectangle at position (75, 9).
; PLAN: r0=141(x), r1=252(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=75(x), r6=9(y), r7=92(width), r8=95(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 252
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 75
LDI r6, 9
LDI r7, 92
LDI r8, 95
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
