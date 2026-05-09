; DESCRIPTION: Composite: Sets a single cyan pixel at (391, 149) then Places a cyan 34x24 rectangle at position (458, 209).
; PLAN: r0=391(x), r1=149(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=458(x), r6=209(y), r7=34(width), r8=24(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 149
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 458
LDI r6, 209
LDI r7, 34
LDI r8, 24
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
