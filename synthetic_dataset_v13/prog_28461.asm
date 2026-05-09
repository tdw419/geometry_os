; DESCRIPTION: Composite: Places a orange dot at position (261, 83) then Renders a cyan box of size 31x49 starting at (317, 177).
; PLAN: r0=261(x), r1=83(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=177(y), r7=31(width), r8=49(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 83
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 317
LDI r6, 177
LDI r7, 31
LDI r8, 49
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
